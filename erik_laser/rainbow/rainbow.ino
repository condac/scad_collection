#include "FastLED.h"
#define NUM_LEDS 144

#define DATA_PIN 5

//CRGBArray<NUM_LEDS> leds;
CRGB leds[NUM_LEDS];

void setup() { 
  FastLED.addLeds<WS2812B,DATA_PIN>(leds, NUM_LEDS); 
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop(){ 
  static uint8_t hue;
  static bool tick;
  digitalWrite(LED_BUILTIN, tick);
  tick = !tick;
  
  // let's set an led value
  for(int i=0;i<NUM_LEDS;i++){
    uint8_t color = hue+(i*(256/NUM_LEDS));
    leds[i] = CHSV(color,255,255);
  }
  hue++;
  FastLED.show();
  // now, let's first 20 leds to the top 20 leds, 

  //FastLED.delay(33);
  delay(100);
  
}
