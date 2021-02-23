## MY MIDTERM PROJECT JOURNAL

### DESCRIPTION:
With my midterm project, I am planning to create a word game that will involve words falling from the sky and a character collecting the words. This game was inspired by a game that I used to play in elementary school during my Typing class sessions. We were given short prompts that we had to type into the computer, and once we were done, we were allowed to play the game. The difference between that game and mine is that in mine, players have to jump and move around to collect the words, but in my elementary school typing class, players had to type in the words they see. 

I could not find the game online, so I cannot directly atach a link. However, I would still like to acknowledge that this is not fully my idea. 

### JOURNAL ENTRIES:

<div align = "center">
  <h3> <u> <b> || Thursday 18th February, 2021 || </b></u></h3>
  </div>
  
Today, I focused on three main things:
- I opened a new document and added in a decsription of my program (that includes my name, date created, last modified, as well as a simple description of what the program does and any instructions to the user. This is to help me in my documentation of all my programs as well as anyone who would want to quickly skim through my work. It also helps Prof.Shiloh when he checks the code, so that he knows how exactly the program works. 

- Next, I decided to add skeletons of the main functions and classes that I would need in the program. This was just to help me have an idea of how much work I would need to do, so that I could plan ahead. I know that the actual needs may change as the program goes, but it is always nice to have clarity and some sort of direction before actually starting to code. 

- Lastly, I decided to load the background images that I had for the game, and to display them when the game begins. This was to just help me get a feel of whether I liked any of the photos, and whether they would match my preferences. I also decided to go ahead and add a platform i.e. the place that my character will be standing on. I wanted to also figure out the dimensions of this platform , which would further help me in my calculations as the game progresses. I then also decided to position my character. I hard-coded the x and y positions as well as the height and width for an ellipse, but again, that was only because I was trying to get the proper dimensions of the character. 

 - The final code is shown below:
 
```Processing
/*
 Name: Nelda John
 Date created: 14-02-2021
 Last modified: 18-02-2021
 Due date: 04-03-2021
 
 Description:
 This is my midterm project in the Introduction to IM course:
 - This code displays Nelda's application of all the concepts learnt from the beginning of the semester including the use of functions, classes, conditional statements,
 loops, and many other concepts. The main aim of this project, however, is to apply concepts of Object-Oriented Programming.
 
 Usage:
 - There is a character that is supposed to jump up and down, or move left and right to "catch" words that are falling from the sky. Every time the character knocks a word, it gains 
 points equal to the number of letters in the word. The character has the chance to miss only 5 words, and after that, the game will be over. To win the game, they should score all the words.
 As the game runs, the score and the blocks left to lose are shown in the bottom right corner. If the game ends, the player is told whether they successfully got all words or not, and the game
 restarts.
 */

//global variables
/*
wordsArray 
 gameScore
 blocksLeft
 numberOfWords
 */

void setup()
{
  size(1280, 720);
}

void draw()
{
  //load and show background
  PImage my_background = loadImage("media/blue_background.png"); 
  image(my_background, 0, 0);
  //load and show platform
  PImage my_platform = loadImage("media/platform_8.png");
  image(my_platform, 0, height-100, width, 100);
  
  //show circle (player)
  fill(0);
  ellipse(25,height-125,50,50);
}

class Player
{
  //attributes [xpos, ypos, width, height, gravity, x_speed, y_speed, radius]
  //constructor method
  //gravity method
  //update the player's position
  //show the player
}

class Platform
{
  //attributes [xpos, ypos, width, height]
  //constructor method
  //display the platform
}

class Word
{
  //attributes [xpos, ypos, width of the box, height of the box, color of the box]
  //constructor method
  //update the word's position
  //show the word
}
```
And the outcome looked like the one below:
![](Media/day_1.png)

#### What worked:
- The main thing that worked was that the platform I used had fit in perfectly with the height and width of my canvas. I tried several platforms, but they all were either stretched in the x or y directions and they looked blurry. So, I'm glad that I found one that actually works and looks good.


#### What didn't work:
- Since I did the bare minimum, I did not come across many hurdles. The main issue was that I displayed the platform and the circle before the background, so whne I ran my program, I only saw the background. However, that was easily fixed with just moving the lines to where they belong and everything worked just fine.

#### Modifications:
- I plan to display the platform and the player from their own classes. So, I will move the statements to their respective classes, and I will only call the show methods for each object.




<div align = "center">
  <h3> <u> <b> || Friday 19th February, 2021 ||</b> </u></h3>
  </div>
  
Today, I focused on these main things:
- I worked on the player and platform classes. In both classes, I declared the variables responsible for my object's attributes and then I assigned values to them in their constructors. 
  - For the platform class, I added a showPlatform() method in which I load and display the platform like I had done in the draw function yesterday. This is super useful, because I can then detect the collision of the words when they hit the platform, and this will affect how many blocks are left for the player to lose. This is what the code looks like now:
 ```Processing
 class Platform
{
  //attributes
  int x_pos, y_pos;
  int pWidth, pHeight;

  //constructor method
  Platform(int aXpos, int aYpos, int aWidth, int aHeight)
  {
    x_pos = aXpos;
    y_pos = aYpos;
    pWidth = aWidth;
    pHeight = aHeight;
  }

  //display method
  void showPlatform()
  {
    fill(0); 
    PImage my_platform = loadImage("media/platform_8.png");
    image(my_platform, x_pos, y_pos, pWidth, pHeight);
  }
}
 ```
  - For the player class, I added the updatePosition() method and I also gave the player a showPlayer() method. I decided to work further on the updatePosition method, so as to allow some movement for my player. I chose to give the player four different ranges of motion (i.e UP, LEFT, RIGHT, and DOWN). I incorporated this into my player's movements by using the keyCode() function in processing. Initially, I could not detect key releases and I did not want to add key handlers, so I decided to enclose everything into an If KeyPressed() function, so that the commands only work when the key is pressed, and not when the key is released. I also think this will be useful in applying gravity, although I am starting to wonder if I will need both gravity() and the DOWN keyCode(). I will decide this as I go, but in the mean time, I will work with the DOWN key alone, but still reserve some space for potentially including gravity later on. This is what the two methods look like:
  ```Processing
  class Player
{
  //attributes
  float x_pos, y_pos, pWidth, pHeight, pGravity;
  float pRadius = 25;
  float x_velocity = 25;
  float y_velocity = 25;
  boolean alive = true;

  //constructor method
  Player(float aXpos, float aYpos, float aWidth, float aHeight, float aGravity)
  {
    //set all the attributes using the constructor
    x_pos = aXpos;
    y_pos = aYpos;
    pWidth = aWidth;
    pHeight = aHeight;
    pGravity = aGravity;
  }

  //method that controls the player's gravity
  void gravity()
  {
  }

  //method that updates the player's position
  void updatePlayer()
  {
    //check if the ball is within the canvas
    if ((x_pos >= pRadius) && (x_pos <= width-pRadius) && (y_pos <= 635) && (y_pos >= pRadius))
    {
      if (keyPressed)
      {
        //if the player picks right
        if (keyCode == RIGHT)
        {
          if (x_pos < width-pRadius)
          {
            x_pos +=  x_velocity;
          }
        } 
        //if the player picks left
        else if (keyCode == LEFT)
        {
          if (x_pos > pRadius)
          {
            x_pos -= x_velocity;
          }
        } 
        //if the player picks up
        else if (keyCode == UP)
        {
          if (y_pos > pRadius)
          {
            y_pos -= y_velocity;
          }
        }
        //if the player picks down
        else if (keyCode == DOWN)
        {
          if (y_pos < height- (100+pRadius))
          {
            y_pos += y_velocity;
          }
        }
      }
    }
  }

  //method that shows the player
  void showPlayer()
  {
    updatePlayer(); //update the player's position first 
    fill(0);
    ellipse(x_pos, y_pos, pWidth, pHeight); //show the player's position
  }
  }
  ```
- I also started to work on the words class:

#### What worked:

#### What didn't work:

#### Modifications:

  
<div align = "center">
  <h3> <u>Saturday 20th February, 2021</u></h3>
  </div>
  
  <div align = "center">
  <h3> <u>Monday 21st February, 2021</u></h3>
  </div>
  


