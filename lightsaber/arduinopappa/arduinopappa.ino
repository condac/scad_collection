#include "FastLED.h"

//#include <EEPROM.h>
#include  <avr/eeprom.h>

#define NUM_LEDS 128

#define DATA_PIN 2

#define BATT_MAX 4100
#define BATT_MIN 3300

#define BUTTON 4
//CRGBArray<NUM_LEDS> leds;
CRGB leds[NUM_LEDS];
long battV = 4100;

uint8_t r;
uint8_t g;
uint8_t b;

uint8_t br;
uint8_t bg;
uint8_t bb;

uint8_t savecolor;


void setup() { 
  Serial.begin(115200);
  FastLED.addLeds<WS2812B,DATA_PIN>(leds, NUM_LEDS); 
  pinMode(13, OUTPUT);
  pinMode(BUTTON, INPUT_PULLUP);
  //savecolor = EEPROM.read(1);
  savecolor = eeprom_read_byte((uint8_t*)1);
  setColor(savecolor);
  Serial.println("startup");
  Serial.println(savecolor);
  
  savecolor++;
  handleandsavecolor();

  startupMode();
  
}

void handleandsavecolor() {
  if (savecolor > 6) {
    savecolor = 1;
  }
  if (savecolor < 1) {
    savecolor = 6;
  }
  //EEPROM.write(1, savecolor);
  eeprom_write_byte((uint8_t*)1,savecolor);
}
void handlecolor() {
  if (savecolor > 6) {
    savecolor = 1;
  }
  if (savecolor < 1) {
    savecolor = 6;
  }

}

void setColor(byte color) {
  if (color == 1) {
    r = 255;
    g = 0;
    b = 0;
  } else if (color == 2) {
    r = 0;
    g = 255;
    b = 0;
  } else if (color == 3) {
    r = 0;
    g = 0;
    b = 255;
  } else if (color == 4) {
    r = 128;
    g = 0;
    b = 128;
  } else if (color == 5) {
    r = 128;
    g = 128;
    b = 0;
  } else if (color == 6) {
    r = 0;
    g = 128;
    b = 128;
  } else {
    r = 255;
    g = 0;
    b = 0;
  }
  
}

bool startup = true;

bool pressed = false;

bool lowbattsoon = false;

void loop() { 
  bool tick = (millis()/500) & 1;
  static long battimer;
  if (millis()>battimer) {
    battimer = millis() +1000;
    battV = myfilter(battV, vccVoltage(), 10);
    battColor(battV);
  }
  if (battV < 3100) {
    lowbattsoon = true;
  }
  else {
    lowbattsoon = false;
  }
  if (battV < 2900) {
    lowbatteryMode();
  }
  else {
  
    digitalWrite(13, tick);
    //Serial.println("loop");
    
    //Serial.println(savecolor);
    
    if (!digitalRead(BUTTON)) {
      batteryMode();
      if (!pressed) {
        pressed = true;
        savecolor++;
        handlecolor();
        
        setColor(savecolor);
      }
      
    }else {
      pressed = false;
      normalMode();
    }
  
    if (millis() > 5000 && startup) {
      startup = false;
      savecolor--;
      handleandsavecolor();
    }
  }
}

void batteryMode() {
  static uint8_t hue;
  static bool tick;
  //digitalWrite(13, tick);
  //tick = !tick;
  battV = myfilter(battV, vccVoltage(), 10);
  int battleds = map(battV, BATT_MIN, BATT_MAX, 0, NUM_LEDS);
  battleds = constrain(battleds, 0, NUM_LEDS);
  
  Serial.println(battV);
  // let's set an led value
  for(int i=5;i<NUM_LEDS;i++){
    uint8_t color = hue+(i*(256/NUM_LEDS));
    uint8_t v = 10;
    if (i>battleds) {
      v = 0;
    }
    leds[i] = CHSV(color,255,v);
  }
  leds[0] = CRGB(bg,br,bb);
  leds[1] = CRGB(bg,br,bb);
  leds[2] = CRGB(bg,br,bb);
  leds[3] = CRGB(bg,br,bb);
  leds[4] = CRGB(bg,br,bb);
  //hue++;
  FastLED.show();
  // now, let's first 20 leds to the top 20 leds, 

  //FastLED.delay(33);
  delay(200);
  
  
}

void lowbatteryMode() {
  for(int i=5;i<NUM_LEDS;i++){
    
    leds[i] = CRGB(0,0,0);
  }
  leds[0] = CRGB(bg,br,bb);
  leds[1] = CRGB(bg,br,bb);
  leds[2] = CRGB(bg,br,bb);
  leds[3] = CRGB(bg,br,bb);
  leds[4] = CRGB(bg,br,bb);
  
  leds[NUM_LEDS-3] = CRGB(0,128,0);
  //hue++;
  FastLED.show();
  
}
void normalMode() {
  static uint8_t hue;
  static bool tick;
  static int pulse;
  
  tick = !tick;
  
  // let's set an led value
//  for(int i=NUM_LEDS/2;i<NUM_LEDS;i++){
//    leds[i] = CRGB(r,g,b);
//  }
//  for(int i=5;i<NUM_LEDS/2;i++){
//    leds[i] = CRGB(r/2,g/2,b/2);
//  }
//  FastLED.show();
//  for(int i=NUM_LEDS/2;i<NUM_LEDS;i++){
//
//
//    leds[i] = CRGB(r/2,g/2,b/2);
//  }
  int ran = random(40);
  uint8_t r2 = 0;
  uint8_t g2 = 0;
  uint8_t b2 = 0;
  if (r>ran) {
    r2 = r-ran;
  }
  if (g>ran) {
    g2 = g-ran;
  }
  if (b>ran) {
    b2 = b-ran;
  }
  if (lowbattsoon) {
    r2 = r2 /2;
    g2 = g2 /2;
    b2 = b2 /2;
  }
  for(int i=5;i<NUM_LEDS;i++){
    leds[i] = CRGB(r2,g2,b2);
  }
//  for(int i=NUM_LEDS/2;i<NUM_LEDS;i++){
//    leds[i] = CRGB(r,g,b);
//  }
//  leds[pulse] = CRGB(0,0,0);
//  leds[pulse+1] = CRGB(0,0,0);
//  pulse++; 
//  pulse++; 
//  pulse++; 
//  if (pulse>=NUM_LEDS-1) {
//    pulse = 5;
//  }
  leds[0] = CRGB(bg,br,bb);
  leds[1] = CRGB(bg,br,bb);
  leds[2] = CRGB(bg,br,bb);
  leds[3] = CRGB(bg,br,bb);
  leds[4] = CRGB(bg,br,bb);
  FastLED.show();
  
  // now, let's first 20 leds to the top 20 leds, 

  //FastLED.delay(33);
  //delay(100);
}

void startupMode() {
  long timediff = 100/NUM_LEDS;
  for(int i=5;i<NUM_LEDS;i++){
    leds[i] = CRGB(r/2,g/2,b/2);
    battV = myfilter(battV, vccVoltage(), 10);
    battColor(battV);
    leds[0] = CRGB(bg,br,bb);
    leds[1] = CRGB(bg,br,bb);
    leds[2] = CRGB(bg,br,bb);
    leds[3] = CRGB(bg,br,bb);
    leds[4] = CRGB(bg,br,bb);
    FastLED.show();
    //delay(timediff);
  }
  
}

long vccVoltage() {
  // Function to read battery voltage from Vcc
  long result;
  // Read 1.1V reference against AVcc
  ADMUX = _BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
  //delay(2); // Wait for Vref to settle
  ADCSRA |= _BV(ADSC); // Convert
  while (bit_is_set(ADCSRA,ADSC));
  result = ADCL;
  result |= ADCH<<8;
  result = 1126400L / result; // Back-calculate AVcc in mV
  return result;
}

void battColor(int vcc) {
  int temp = map(vcc, 3100, 4100, 0, 170);
  int hue = constrain(temp, 0, 200);
  br = HUEr(hue);
  bg = HUEg(hue);
  bb = HUEb(hue);
  
}

int pyramid(int input, int valuemin, int valuemax, int outmin, int outmax) {

  int middle = (valuemin + valuemax)/2;
  int out;
  if (input > middle) {
    out = map(input, middle, valuemax, outmax, outmin);
    out = constrain(out, outmin, outmax);
  } else {
    out = map(input, valuemin, middle, outmin, outmax);
    out = constrain(out, outmin, outmax);
  }
  return out;
}


int HUEr(int hue) {
  hue = hue*3;
  hue = hue+768;
  return pyramid(hue, 512,1024,0,255);
}

int HUEg(int hue) {
  hue = hue*3;
  
  return pyramid(hue, 0,512,0,255);
}

int HUEb(int hue) {
  hue = hue*3;
  return pyramid(hue, 255,768,0,255);
}

long myfilter(long currentValue, long newValue, int amp) {
   return ((currentValue*amp) + (newValue))/(amp+1);
}
