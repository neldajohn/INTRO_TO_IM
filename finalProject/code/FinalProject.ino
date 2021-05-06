
/*
   Name: Nelda John
   Date created: 26-04-2021
   Last modified: 05-05-2021
   Description: This is my final project
*/
//global variables
char val; //data received from the serial port
int RED = 12;
int BLUE = 8;


void setup()
{
  pinMode(BLUE, OUTPUT);
  pinMode(RED, OUTPUT);

  //initialize serial communications at a 9600 baud rate
  Serial.begin(9600);
}

void loop()
{
  if (Serial.available())
  {
    val = Serial.read();
  }

  if (val == '1')
  {
    digitalWrite(BLUE, HIGH);
    delay(100);
    digitalWrite(BLUE, LOW);
    delay(100);
    digitalWrite(BLUE, HIGH);
    delay(100);
    digitalWrite(BLUE, LOW);

  }
  else if (val == '0')
  {
    digitalWrite(RED, HIGH);
    delay(100);
    digitalWrite(RED, LOW);
    delay(100);
    digitalWrite(RED, HIGH);
    delay(100);
    digitalWrite(RED, LOW);
  }
  delay(10);
}
