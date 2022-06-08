#include "FastLED.h"
#define NUM_LEDS 1

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
    leds[0] = CHSV(hue++,255,255);
    FastLED.show();
    // now, let's first 20 leds to the top 20 leds, 

    //FastLED.delay(33);
    delay(1);
  
}
