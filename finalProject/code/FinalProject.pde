/*
Name: Nelda John
Project Description: 
- This program allows you to guess the missing word from some motivational quotes.
- Click on the red button to start
- Click on the answers on the screen.
- The blue LED will blink if you are right, the Red LED will blink if you are wrong.
*/

import processing.sound.*;
import processing.serial.*;
import java.util.*; 

Random random = new Random();

Serial myPort; // create object from Serial class
String val; // data received from the serial port
int numQuestions = 8;

SoundFile myfile;
boolean started = false;

ArrayList<Question> myQuestions;
String background;
boolean checkMousePos;
int randomNum = 0;

//The setup function
void setup()
{
  size(1300, 720);
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  myfile = new SoundFile(this, "media/sound.mp3");
  myfile.loop();
  myQuestions = new ArrayList<Question>();
  Question question1 = new Question(1, 'C');
  Question question2 = new Question(2, 'B');
  Question question3 = new Question(3, 'B');
  Question question4 = new Question(4, 'A');
  Question question5 = new Question(5, 'A');
  Question question6 = new Question(6, 'C');
  Question question7 = new Question(7, 'B');
  Question question8 = new Question(8, 'A');
  myQuestions.add(question1);
  myQuestions.add(question2);
  myQuestions.add(question3);
  myQuestions.add(question4);
  myQuestions.add(question5);
  myQuestions.add(question6);
  myQuestions.add(question7);
  myQuestions.add(question8);
}


//The draw function
void draw()
{
  imageMode(CORNER);
  if (started == false)
  {
    background = "background";
    randomNum = random.nextInt(numQuestions);
    println("random num: " + randomNum);
  }
  if (checkMousePos == true)
  {
    background = "background_02";
    started = true;
  }

  PImage my_background = loadImage("media/"+background+".png");
  image(my_background, 0, 0);
  if (background == "background")
  {
    smooth();
    fill(255, 0, 0);
    rect(970, 550, 100, 60);
  }

  if (started == true)
  {
    String answer ;

    myQuestions.get(randomNum);
    answer = myQuestions.get(randomNum).work();

    if (answer == "correct")
    {
      //game over
      //lose
      started = false;
      checkMousePos = false;
    } else if (answer == "wrong")
    {
      //game over
      //win
      started = false;
      checkMousePos = false;
    }
  }
}

void mouseClicked()
{
  if (mouseX > 970 && mouseX < 1070 && mouseY > 550 && mouseY < 610)
  {
    checkMousePos = true;
  }
}

boolean started()
{
  return false;
}

boolean ended()
{
  return false;
}


//the class of questions
class Question
{
  char answer;
  int num;

  Question(int x_num, char x_answer)
  {
    answer = x_answer;
    num = x_num;
  }

  void display()
  {
    PImage my_question = loadImage("media/question_"+ num+".png");
    imageMode(CENTER);
    image(my_question, width/2, height/2);
  }

  boolean mouseCheck()
  {
    if (answer == 'A')
    {
      if (mouseX > 550 && mouseX <750 && mouseY > 325 && mouseY <350)
      {
        return true;
      }
    } else if (answer == 'B')
    {
      if (mouseX > 550 && mouseX <750 && mouseY > 365 && mouseY <390)
      {
        return true;
      }
    } else if (answer == 'C')
    {
      if (mouseX > 550 && mouseX <750 && mouseY > 400 && mouseY <435)
      {
        return true;
      }
    }

    return false;
  }

  String work()
  {
    String answered = "meeh";
    display();
    if (mousePressed)
    {
      if (mouseCheck())
      {
        myPort.write("1");
        answered = "correct";
      } else 
      {                          
        myPort.write('0');
        answered = "wrong";
      }
    }
    myPort.write('2');
    return answered;
  }
}
