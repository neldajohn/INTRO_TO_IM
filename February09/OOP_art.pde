/*
Name: Nelda John
 Date started: 08-02-2021
 Last modified: 09-02-2021
 Description:
 This is the third project in my intro to IM class. The project is a work of art that implements the use of object oriented programming.
 */

//global variables
final int numberOfFlowers = 420;
Flower[] myFlowersArray = new Flower[numberOfFlowers];

//setup function
void setup()
{
  //define size of the canvas
  size(1440, 780);
  //initiate a count variable
  int count = 0;
  //use a for loop to access the objects in the list
  for (int i = 50; i < width; i = i + 50)
  {
    for (int j = 50; j < height; j = j + 50)
    {
      if (i == 50)
      {
        myFlowersArray[count] = new Flower(i, j, random(10, 40)); //for the first column of flowers
        count++;
      } else
      {
        int i_num = ((i/50)-1)*15;
        int j_num = ((j/50)-1);
        int index = i_num + j_num;
        myFlowersArray[index] = new Flower(i, j, random(10, 40));
        count++; //increment count
      }
    }
  }
}

//draw function
void draw()
{
  //define the background color and framerate
  background(55,90,41);
  frameRate(10); 
  
  //use a for loop to access elements of the list
  for (int i = 0; i < 420; i++)
  {
    myFlowersArray[i].drawFlower(); //draw each flower
    myFlowersArray[i].shakeRandom(); //randomize the movement of the flower
    if (frameCount%2 == 0)
    {
      myFlowersArray[i].enlargeFlower();
    } else
    {
      myFlowersArray[i].minimizeFlower();
    }
    //use keycodes to control the movement of the flowers
    if (keyCode == UP || keyCode == DOWN)
    {
      myFlowersArray[i].shakeUpAndDown();
    } else if (keyCode == RIGHT || keyCode == LEFT)
    {
      myFlowersArray[i].shakeLeftAndRight();
    }
  }
  //reset the flower sizes after 500 frames
  if (frameCount%500 == 0)
  {
    setup();
  }
}


//flower class
class Flower {
  //variables
  float expansion = 20;
  //attributes
  float middleX, middleY;
  float middleSize = random(10, 20);
  float petalSize;

  //constructor method
  Flower(float aXpos, float aYpos, float aPetalSize)
  {
    middleX = aXpos;
    middleY = aYpos;
    petalSize = aPetalSize;
  }

  //the method that draws the flower
  void drawFlower()
  {
    //variables
    float colorR = random(0, 255);
    float colorG = random(0, 255);
    float colorB = random(0, 255);
    float sizeProportion = petalSize/10;
    //control elements of the flower
    noFill();
    stroke(0);
    strokeWeight(2);
    //stalk properties
    arc (middleX- (2.5* sizeProportion), middleY + petalSize, (9*sizeProportion), (13*sizeProportion), radians(300), radians(420));
    arc(middleX + (2.5* sizeProportion), middleY + petalSize, (9*sizeProportion), (13*sizeProportion), radians(120), radians(240));
    //petal properties
    noStroke();
    fill(colorR, colorG, colorB);
    //use a for loop to draw the ellipses of the flower
    for (int i = 0; i < 4; i++)
    {
      if (i == 0)
      {
        ellipse(middleX, middleY - (petalSize/2), (6*sizeProportion), petalSize);
      } else if (i == 1)
      {
        ellipse(middleX - (petalSize/2), middleY - (3*sizeProportion), (6*sizeProportion), petalSize);
      } else if ( i == 2)
      {
        ellipse(middleX, middleY, petalSize, petalSize);
      } else if (i == 3)
      {
        ellipse(middleX + (petalSize/2), middleY - (3*sizeProportion), (6*sizeProportion), petalSize);
      }
    }
  }

  //method that enlarges the flower
  void  enlargeFlower()
  {
    petalSize = petalSize*1.05;
    drawFlower();
  }
  //method that minimizes the flower
  void minimizeFlower()
  {
    petalSize = petalSize*0.95;
    drawFlower();
  }
  //method that shakes the flower sideways
  void shakeLeftAndRight()
  {
    if (frameCount%2 == 0)
    {
      middleX = middleX - 5 ;
    } else
    {
      middleX = middleX + 5;
    }
  }
  //method that shakes the flower up and down
  void shakeUpAndDown()
  {
    if (frameCount%2 == 0)
    {
      middleY = middleY - 5;
    } else
    {
      middleY = middleY + 5;
    }
  }

  //method that shakes the flowers in random direction
  void shakeRandom()
  {
    if (frameCount%2 == 0)
    {
      middleX = middleX - random(-5, 5);
      middleY = middleY - random(-5, 5);
    }
  }
}
