/*
   Name: Nelda John
   Date created: 29-03-2021
   Last modified: 29-03-2021
   Description: This program shows two LEDs that are control digitally
   and analogally.
*/

      //Declaring variables
  //LEDs
const int BLUE_LED = 9;
const int RED_LED = 6;
const int YELLOW_LED = 3;

  //Sensors
const int SWITCH_BLUE = A0;
const int LDR = A4;

  //Other variables
int brightness = 0;
int fadeAmount = 20;


  //Setup Function
void setup() {
        // Output
  pinMode(BLUE_LED, OUTPUT);
  pinMode(RED_LED, OUTPUT);
  pinMode(YELLOW_LED, OUTPUT);
        //Input
  pinMode(SWITCH_BLUE, INPUT);
  pinMode(LDR, INPUT);

}


//Loop Function
void loop() {

        //set LED values
  digitalWrite(BLUE_LED, LOW);
  digitalWrite(RED_LED, LOW);
  digitalWrite(YELLOW_LED, LOW);
        //sensors and switches
  int sensorValue = analogRead(LDR);
  int switch_blue = digitalRead(SWITCH_BLUE);

  //if the switch is turned on
  if (switch_blue == HIGH)
  {
    if (sensorValue > 400)
    {
              //4 sec by 4 sec breathing
      analogWrite(BLUE_LED, (brightness/3));
      analogWrite(RED_LED, (brightness/3));
      analogWrite(YELLOW_LED, (brightness/3));

      brightness = brightness + fadeAmount;

      if (brightness <= 0 || brightness >= 255) {
        fadeAmount = -fadeAmount;
      }
      delay(400); //breathe in and out for 4 seconds
    }

    else
    {
      digitalWrite(BLUE_LED, LOW);
      digitalWrite(RED_LED, LOW);
      digitalWrite(YELLOW_LED, LOW);

      for (int i = 0; i < 4; i++)
      {
        digitalWrite(BLUE_LED, HIGH);
        delay(200);
        digitalWrite(BLUE_LED, LOW);
        delay(200);
      }

      for (int i = 0; i < 7; i++)
      {
        digitalWrite(RED_LED, HIGH);
        delay(200);
        
        digitalWrite(RED_LED, LOW);
        delay(200);
      }

      for (int i = 0; i < 8; i++)
      {
        digitalWrite(YELLOW_LED, HIGH);
        delay(200);
        digitalWrite(YELLOW_LED, LOW);
        delay(200);
      }
    }
  }
}
