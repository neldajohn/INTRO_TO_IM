
/*
   Name: Nelda John
   Date created: 24 - 03- 2021
   Last modified: 26 - 03 -2021
   Description: This puzzle includes guessing 5 secret words that will be spelling out secret statement.
   Instructions:
   1. A definition will be presented to you on the monitor.
   2. Enter your option (from 1 -5) of your guess for the described word in the buffer of the serial monitor
   3. The LEDs will flash either blue (for right) or red(for wrong)
   4. Click the red button to stop the red LED from blinking and to see how many trials you have left; the yellow LED will flash the number of trials you have left.
   5. If you get the guess right, the blue LED will flash until you click the blue switch to move on to the next part.

   - Do not enter 0 as an entry
*/


//Declaring variables
int numTrials = 6; // double the number of trials
int user_guess = -1; //setting the user's guess to -1

//LEDs
const int redLed = 12;
const int blueLed = 9;
const int yellowLed = 6;
const int greenLed = 3;
//Switches
const int redSwitch = A0;
const int blueSwitch = A2;
const int yellowSwitch = A4;

//Boolean characters for whether the user got the words
bool got1 = false;
bool lost1 = false;
bool got2 = false;
bool lost2 = false;
bool got3 = false;
bool lost3 = false;
bool got4 = false;
bool lost4 = false;
bool got5 = false;
bool lost5 = false;

//Setup Function
void setup() {

  //set all the pinmodes
  //output
  pinMode(redLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(yellowLed, OUTPUT);
  pinMode(greenLed, OUTPUT);
  //input
  pinMode(redSwitch, INPUT);
  pinMode(blueSwitch, INPUT);
  pinMode(yellowSwitch, INPUT);

  //open serial communications and wait for the port to open
  Serial.begin(9600);
  //introduce the user to the game
  Serial.println("HELLO! WELCOME TO MY GUESSING PUZZLE GAME!");
  Serial.println("\t Shortly, a definition will be displayed on your screen, and you will have to guess the word it is describing.");
  Serial.println("\t Five options will be presented, and you should enter the number of the option that you think is correct.");
}


//Choices display
void Choices(String word1, String word2,  String word3,  String word4, String word5 )
{
  Serial.print("1. ");
  Serial.println(word1);
  Serial.print("2. ");
  Serial.println(word2);
  Serial.print("3. ");
  Serial.println(word3);
  Serial.print("4. ");
  Serial.println(word4);
  Serial.print("5. ");
  Serial.println(word5);
}

//Blinking the LEDs when the wrong answer is chosen
void WrongBlink()
{
  while ( digitalRead(redSwitch) == LOW) //if the red switch is not pressed ... 
  {
    for (int i = 0; i < 4; i++)
    {
      digitalWrite(redLed, HIGH);
      delay(150);
      digitalWrite(redLed , LOW);
      delay(150);
    }
    delay(300);
  }
  //blink the yellow led as many times as the number of trials left
  for (int i = 0; i < (numTrials / 2) + 1; i++)
  {
    digitalWrite(yellowLed, HIGH);
    delay(200);
    digitalWrite(yellowLed , LOW);
    delay(500);
  }
  delay(400);
}

//Blinking the LEDs when the right answer is chosen
void RightBlink()
{
  for (int i = 0; i < 4; i++)
  {
    digitalWrite(blueLed, HIGH);
    delay(150);
    digitalWrite(blueLed , LOW);
    delay(150);
  }
  delay(100);
  greenBlink();
}


//Blinking the green LED
void greenBlink()
{
  while ( digitalRead(blueSwitch) == LOW)
  {
    digitalWrite(greenLed, HIGH);
    delay(600);
    digitalWrite(greenLed , LOW);
    delay(100);
  }
}

//Won or Lost
void WonOrLost()
{
  int Total = 5;
  String words = "";
  if ( !got1 or !got2 or !got3 or !got4 or !got5)
  {
    if (!got1)
    {
      Total -= 1;
      words += "Thank ";
    }
    if (!got2)
    {
      Total -= 1;
      words += "You ";
    }
    if (!got3)
    {
      Total -= 1;
      words += "For";
    }
    if (!got4)
    {
      Total -= 1;
      words += "The ";
    }
    if (!got5)
    {
      Total -= 1;
      words += "Extension ";
    }

    Serial.println("\t\t\t\t\t\t YOU LOST!!!!!!!");
    Serial.print("\t\t Number of words gotten: ");
    Serial.println(Total);
    Serial.println("\t\t You missed the following words: ");
    Serial.println(words);
    Serial.println("The Statement was: 'THANK YOU FOR THE EXTENSION.");
  }
  else
  {
    for (int i = 0; i < 4; i++)
    {
      digitalWrite(blueLed, HIGH);
      //digitalWrite(blueLed, HIGH);
      delay(150);
      digitalWrite(blueLed , LOW);
      delay(150);
    }

    Serial.println("\t\t\t\t\t\tYOU GOT EVERY WORD RIGHT!!!!!");

    Serial.println("\t\t\t\t\t\tTHANK YOU FOR THE EXTENSION!!!!!! ");
  }
}

//Loop Function
void loop()
{
  digitalWrite(blueLed, LOW);
  digitalWrite(redLed, LOW);
  digitalWrite(yellowLed, LOW);
  digitalWrite(greenLed, LOW);
  //for the first word
  if (! (got1) and !(lost1))
  {
    if (user_guess != 0) //if the user's guess is not 0
    {
      //guessing the first word
      Serial.println("\n\t\t\t\t FIRST WORD");
      Serial.println("\n\t Definition: 'Express gratitude to someone' ");
      Serial.print("\t Trials left: ");
      Serial.print(numTrials / 2);
      Serial.println("\n\tCHOICES:");
      Choices("Bless", "Praise", "Laud", "Thank", "Enthrone");
    }
    while (Serial.available() == 0)
    {
      ;//waiting for user's input
    }
    user_guess = Serial.parseInt(); //get user's input
    if (user_guess == 4 ) //if it is correct ...
    {
      got1 = true;
      numTrials = 6;
      RightBlink(); //show the rightblink()
    }
    else //otherwise
    {
      numTrials -= 1; //reduce number of trials
      if (user_guess != 0)
      {
        WrongBlink(); //call wrongblink()
      }
    }

    if (numTrials < 0) //if the no. of trials is less than 0
    {
      numTrials = 6;
      lost1 = true;
      delay(100);
      greenBlink(); //move on and show greenblink()
    }

  }
  //for the second word
  else if (!(got2) and !(lost2))
  {
    if (user_guess != 0)
    {
      //guessing the second word
      Serial.println("\n\t\t\t\t SECOND WORD");
      Serial.println("\t Definition: 'Used to adress someone in the second person' ");
      Serial.print("\t Trials left: ");
      Serial.print(numTrials / 2);
      Serial.println("\n\tCHOICES:");
      Choices("Vous", "You", "Yo", "Thee", "Y'all");
    }
    while (Serial.available() == 0)
    {
      ;//waiting for user's input
    }
    user_guess = Serial.parseInt();
    if (user_guess == 2 )
    {
      got2 = true;
      numTrials = 6;
      RightBlink();
    }
    else
    {
      numTrials -= 1;
      if (user_guess != 0)
      {
        WrongBlink();
      }
    }

    if (numTrials < 0)
    {
      numTrials = 6;
      lost2 = true;
      delay(100);
      greenBlink();
    }
  }
  //for the third word
  else if (!(got3) and !(lost3))
  {
    if (user_guess != 0)
    {
      //guessing the third word
      Serial.println("\n\t\t\t\t THIRD WORD");
      Serial.println("\t Definition: 'Used as a function to indicate purpose' ");
      Serial.print("\t Trials left: ");
      Serial.print(numTrials / 2);
      Serial.println("\n\tCHOICES:");
      Choices("Of", "Because", "With", "Due", "For");
    }
    while (Serial.available() == 0)
    {
      ;//waiting for user's input
    }
    user_guess = Serial.parseInt();
    if (user_guess == 5 )
    {
      got3 = true;
      numTrials = 6;
      RightBlink();
    }
    else
    {
      numTrials -= 1;
      if (user_guess != 0)
      {
        WrongBlink();
      }
    }

    if (numTrials < 0)
    {
      numTrials = 6;
      lost3 = true;
      delay(100);
      greenBlink();
    }
  }
  //for the fourth word
  else if (!(got4) and !(lost4))
  {
    if (user_guess != 0)
    {
      //guessing the fourth word
      Serial.println("\n\t\t\t\t FOURTH WORD");
      Serial.println("\t Definition: 'Denoting a thing already mentioned or assumed to be common knowledge' ");
      Serial.print("\t Trials left: ");
      Serial.print(numTrials / 2);
      Serial.println("\n\tCHOICES:");
      Choices("The", "Those", "An", "A", "That");
    }
    while (Serial.available() == 0)
    {
      ;//waiting for user's input
    }
    user_guess = Serial.parseInt();
    if (user_guess == 1 )
    {
      got4 = true;
      numTrials = 6;
      RightBlink();
    }
    else
    {
      numTrials -= 1;
      if (user_guess != 0)
      {
        WrongBlink();
      }
    }

    if (numTrials < 0)
    {
      numTrials = 6;
      lost4 = true;
      delay(100);
      greenBlink();
    }
  }
  //for the fifth word
  else if (!(got5) and !(lost5))
  {
    if (user_guess != 0)
    {
      //guessing the fifth word
      Serial.println("\n\t\t\t\t FIFTH WORD");
      Serial.println("\t Definition: 'The noun used to denote the postponing of an assignment or work to a later due date' ");
      Serial.print("\t Trials left: ");
      Serial.print(numTrials / 2);
      Serial.println("\n\tCHOICES:");
      Choices("Prolong", "Addition", "Extension", "Delay", "Allowance");
    }
    while (Serial.available() == 0)
    {
      ;//waiting for user's input
    }
    user_guess = Serial.parseInt();
    if (user_guess == 3 )
    {
      got5 = true;
      numTrials = 6;
      RightBlink();
      //check for winning or losing
      WonOrLost();
    }
    else
    {
      numTrials -= 1;
      if (user_guess != 0)
      {
        WrongBlink();
      }
    }
    //if the number of traisl is less than 0
    if (numTrials < 0)
    {
      numTrials = 6;
      lost5 = true;
      delay(100);
      greenBlink();
      //check for winning or losing
      WonOrLost();
    }
  }

}
