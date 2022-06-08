#include "Keyboard.h"

#define PIN  3
#define LED  15
long counter;

bool keypress;

void setup() {
  pinMode(PIN, INPUT_PULLUP);
  pinMode(LED, OUTPUT);
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
  int state = digitalRead(PIN);
  digitalWrite(LED, state);
  

}
