#include "Keyboard.h"

int button = 2;

long counter;

bool keypress;

void setup() {
  pinMode(button, INPUT_PULLUP);
  // open the serial port:
  Serial.begin(9600);
  // initialize control over the keyboard:
  Keyboard.begin();
  Serial.println("start Push to talk");
  counter = millis();
  keypress = false;
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(button) == LOW) {
    counter = millis()+100;
  } 
  if (counter < millis()) {
    if (keypress) {
      Keyboard.releaseAll();
      keypress = false;
      Serial.println("release key");
      
    }
    
    
  } else {
    if (!keypress) {
      keypress = true;
      Keyboard.press(KEY_F14);
      Serial.println("Press key!");
    }
  }

}
