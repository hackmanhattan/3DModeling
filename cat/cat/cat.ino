#include <Stepper.h> // Include the header file

// change this to the number of steps on your motor
#define STEPS 32

// create an instance of the stepper class using the steps and pins
Stepper stepper(STEPS, 8, 10, 9, 11);

int val = 0;
int num_of_hours = 8;
void setup() {
  Serial.begin(9600);
  stepper.setSpeed(800);
}

void loop() {

feed();
wait_for_feed();



}
void wait_for_feed() {
 
  for(int i=0;i<num_of_hours;i++) {
    delay(1000*60*60);//1 hour
  }
}
void feed() {
  for(int i=0;i<2;i++) {
    stepper.step(4200); //4200 is about 1 rotation on main gear
    //jiggle
    stepper.step(-400);
    stepper.step(400);
  }
}
