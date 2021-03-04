/*
Name: Nelda John
 Date created: 14-02-2021
 Last modified: 15-02-2021
 Due date: 16-02-2021
 Description:
 This is my midterm project in the Introduction to IM course:
 - This code displays Nelda's application of all the concepts learnt from the beginning of the semester
 Usage:
 - A frog that jumps and catches a list of animal words.
 */



//IMPORT LIBRARIES
import processing.sound.*;
SoundFile soundfile;
SoundFile gameSoundfile;
SoundFile lostwordfile;

//GLOBAL VARIABLES
int game_score;
int blocks_left;
int numberOfWords;
int total_points;
Word[] myWordsArray = new Word[71];
ArrayList<Integer> myPositions = new ArrayList<Integer>();
ArrayList<Integer> lostPositions = new ArrayList<Integer>();
String words[];
String background;
ArrayList<Word> myScoredWords = new ArrayList<Word>();
Level game;// = new Level_One(1275, 750);
boolean gameProceed;

//SETUP FUNCTION
void setup()
{
  game_score = 0;
  blocks_left = 5;
  numberOfWords = 0;
  gameProceed = false;
  game = new Level(1275, 750);
  size(1275, 750); //set canvas size
  soundfile = new SoundFile(this, "media/sound.wav");
  gameSoundfile = new SoundFile(this, "media/background_music.mp3");
  lostwordfile = new SoundFile(this, "media/lostword.wav");
  if (game.gameEnd != true)
  {
    gameSoundfile.loop();
  }

  words = loadStrings("animals.csv"); //load the animal data
  numberOfWords = words.length;
  //use a for loop to add all the words in the list to an array
  for (int i = 0; i < words.length; i++)
  {
    total_points += words[i].length();
    float my_yPos = random(-5000, 0);
    float my_xPos = random (0, (i+1)*25);
    float my_speed;
    if (my_yPos > -2000 )
    {
      my_speed = random (1.0, 2.0);
    } else if ( my_yPos > -4000 && my_yPos < -2000)
    {
      my_speed = random (2.0, 3.5);
    } else
    {
      my_speed = random(3.5, 5.0);
    }
    if (my_xPos > width - 10*(words[i].length()))
    {
      my_xPos = (i-20) *17;
    }
    Word myNewWord = new Word(words[i], my_xPos, my_yPos, 10*(words[i].length()), 20, my_speed);
    myWordsArray[i] = myNewWord;
  }
}



//DRAW FUNCTION
void draw()
{
  smooth(); //smoothen out the sketches
  game.showLevel(); //call the play object -> depends on the level selected
}


//PLAYERS' GENERIC CLASS
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

  //method that updates the player's position
  void updatePlayer()
  {
    //check if the ball is within the canvas
    if ((x_pos >= 0) && (x_pos <= width-(2*pRadius)) && (y_pos <= 600) && (y_pos >= 0))
    {
      if (keyPressed)
      {
        //if the player picks right
        if (keyCode == RIGHT)
        {
          if (x_pos < width-(2*pRadius))
          {
            x_pos +=  x_velocity;
          }
        } 
        //if the player picks left
        else if (keyCode == LEFT)
        {
          if (x_pos >= pRadius)
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
          if (y_pos < height- (125+pRadius))
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
    PImage my_player = loadImage("media/" + background + "_face.png");
    image(my_player, x_pos, y_pos, pWidth, pHeight);
    //fill(0);
    //ellipse(x_pos, y_pos, pWidth, pHeight); //show the player's position
  }

  //check if the ball collides with the words
  boolean Knock()
  {
    //prepare a new array list to copy all the words not scored
    boolean check = false;

    //iterate through the array of words
    for (int i = 0; i < myWordsArray.length; i++)
    {
      float y_knockPoint = (myWordsArray[i].y_pos + myWordsArray[i].word_height);
      float x_knockPoint = (myWordsArray[i].x_pos + myWordsArray[i].word_width);
      if ((y_knockPoint >= y_pos - pRadius) && (y_knockPoint <= y_pos + pRadius) && (x_pos+pRadius >= myWordsArray[i].x_pos) && (x_pos - pRadius <= x_knockPoint ) )
      {
        boolean scored = false;
        for (int num : myPositions)
        {
          if ( i == num)
          {
            scored = true;
          }
        } 
        if (scored == false)
        {
          game_score += myWordsArray[i].the_word.length();
          soundfile.play();
          myPositions.add(i);
        }
        check = true;
        return check;
      }
    }

    return check;
  }

  //check if any word has been lost
  boolean LostWords()
  {
    //prepare a new array to copy
    boolean check = false;

    //iterate through the array of words
    for (int i = 0; i < myWordsArray.length; i++)
    {

      if (myWordsArray[i]. y_pos >= height-100)
      {
        boolean lost = false;
        for (int num : lostPositions)
        {
          if (i == num)
          {
            lost = true;
          }
        }
        if (lost == false)
        {
          if (blocks_left > 0)
          {
            blocks_left -= 1;
            lostPositions.add(i);
            lostwordfile.play();
          } else if (blocks_left <= 0)
          {
            alive = false;
          }
        }
        check = true;
      }
    }
    return check;
  }

  //check if the user got all the words correctly
  boolean WonGame()
  {
    if (game_score >= total_points)
    {
      return true;
    }
    return false;
  }
}




//the class for the main platform
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
    PImage my_platform = loadImage("media/platform.png");
    image(my_platform, x_pos, y_pos, pWidth, pHeight);
  }
}


//main class for all the word blocks
class Word
{
  //attributes
  float x_pos, word_width, word_height, word_speed;
  float y_pos;
  String the_word;

  //constructor
  Word(String aWord, float aXpos, float aYpos, float aWidth, float aHeight, float aSpeed)
  {
    the_word = aWord;
    x_pos = aXpos;
    y_pos = aYpos;
    word_width = aWidth;
    word_height = aHeight;
    word_speed = aSpeed;
  }

  //update the position of the word
  void update()
  {
    if (y_pos < height)
    {
      y_pos += word_speed;
    }
  }

  //method that shows word
  void displayWord()
  {
    if (background == "blue")
    {
      fill(78, 182, 237);
    } else if (background == "pink")
    {
      fill(255, 142, 204);
    } else if (background == "green")
    {
      fill(151, 237, 222);
    } else
    {
      fill(245, 143, 64);
    }
    rect(x_pos, y_pos, word_width, word_height);

    //typing the word
    PFont f = createFont("monaco", 15);
    textFont(f, 15);
    fill(255);
    textAlign(CENTER);
    text(the_word, x_pos+1+(word_width/2), y_pos + (3*(word_height/4)));
  }
}

//class level_frog
class Level
{
  //attributes
  //gameSound.loop();
  float level_width, level_height;
  boolean gameStart = false;
  boolean gameEnd = false;
  int status;

  Player my_circle = new Player(25, 600, 50, 50, 10);

  //constructor method
  Level(float aWidth, float aHeight)
  {
    level_width = aWidth;
    level_height = aHeight;
  }

  //method that checks for win
  boolean checkWin()
  {
    return my_circle.WonGame();
  }

  //method that checks for losses
  boolean checkLoss()
  {
    my_circle.LostWords();
    if (my_circle.alive == true)
    {
      return false;
    } else
    {
      return true;
    }
  }

  //method that shows the level
  void showLevel()
  {
    if (gameEnd == true)
    {
      //gameStart = false;
      gameSoundfile.stop();
      if (status == 1)
      {
        background (0);
      } else
      {
        background(255);
        EndCover();
      }
    } else if (gameStart == false)
    {
      PImage my_cover = loadImage("media/page.png");
      image(my_cover, 0, 0);
      showCover();
    } else if (gameStart == true)
    {
      checkWin();
      checkLoss();

      PImage my_background = loadImage("media/" + background +"_background.png");
      Platform my_platform = new Platform(0, height-100, width, 100);

      if (!(checkWin()) && !(checkLoss()))
      {
        //display the platform and show player
        image(my_background, 0, 0);
        my_circle.showPlayer();


        //show the words falling
        for (int i = 0; i < myWordsArray.length; i++)
        {

          boolean scored = false;
          for (int num : myPositions)
          {
            if ( i == num)
            {
              scored = true;
            }
          }
          if (scored == false)
          {
            myWordsArray[i].displayWord();
            myWordsArray[i].update();
          }
        }

        my_platform.showPlatform();
        my_circle.Knock();
        my_circle.LostWords();
        my_circle.WonGame();

        PFont f = createFont("monaco", 20);
        textFont(f, 20);
        fill(255, 255, 255, 60);
        rect(width-230, height-90, 220, 80);
        fill(0);
        textAlign(CENTER);
        text("SCORE: ", width-150, height-65);
        text(game_score, width-90, height-65);
        text("BLOCKS LEFT:", width-130, height-30);
        text(blocks_left, width-35, height-30);
      } else if (checkWin())
      {
        gameEnd = true;
        status = 1;
      } else if (checkLoss())
      {
        gameEnd = true;
        status = 0;
      }
      checkWin();
      checkLoss();
    }
  }
}

void showCover()
{
  PFont f = createFont("cochin", 50);
  textFont(f, 60);
  fill(255, 255, 255, 60);
  rect((width/2)-230, (height/2)-150, 460, 100);
  //levels boxes
  rect((width/2)-220, (height/2)+20, 200, 40);
  rect((width/2)-220, (height/2)+70, 200, 40);
  rect((width/2)+20, (height/2)+20, 200, 40);
  rect((width/2)+20, (height/2)+70, 200, 40);

  fill(0);
  textAlign(CENTER);
  text("WORD GAME", width/2, (height/2)-75);
  textFont(f, 25);
  text("Pick a level or click anywhere to automatically start on level 1", width/2, (height/2));
  textAlign(LEFT); 
  text("LEVEL ONE", (width/2)-200, (height/2)+50);
  text("LEVEL TWO", (width/2)+50, (height/2)+50);
  text("LEVEL THREE", (width/2)- 200, (height/2) + 100);
  text("LEVEL FOUR", (width/2) + 50, (height/2) + 100);

  fill(255);
  textAlign(CENTER);
  text("Instructions: ", width/2, (height/2)+ 170);
  textAlign(LEFT);
  textFont(f, 18);
  text("1. Use the LEFT and RIGHT arrow keys to move the player sideways", (width/2) - 290, (height/2)+ 200);
  text("2. Use the UP and DOWN arrow keys to move the player vertically", (width/2)-290, (height/2) + 220);
  text("3. Knock words from the top of the player's head to earn 1 point per letter in the word.", (width/2) - 290, (height/2)+ 240);
  text("4. You can miss a total of 5 words before the game ends.", (width/2) - 290, (height/2)+ 260);
  text("5. Have fun :) ", (width/2) - 290, (height/2)+ 280);
}

void LevelPicked(float x, float y)
{
  if ( (x >= (width/2)-220) && (x <= (width/2)+20 ) && ( y >= (height/2)+20 ) && ( y < (height/2)+60 ))
  {
    background = "blue";
  } else if ( (x >= (width/2)+ 20) && (x <= (width/2)+220 ) && ( y >= (height/2)+20 ) && ( y < (height/2)+60 ))
  {
    background = "pink";
  } else if ( (x >= (width/2)-220) && (x <= (width/2)+20 ) && ( y >= (height/2)+70 ) && ( y < (height/2)+110 ))
  {
    background = "green";
  } else if ( (x >= (width/2)+ 20) && (x <= (width/2)+220 ) && ( y >= (height/2)+70 ) && ( y < (height/2)+110 ))
  {
    background = "orange";
  } else
  {
    background = "blue";
  }
}

void EndCover()
{
  PImage my_image = loadImage("media/page.png");
  image(my_image, 0, 0);
  //zapfino
  PFont f = createFont("Cochin", 150);
  textFont(f, 150);
  textAlign(CENTER);
  fill(0);
  text( "GAME OVER", width/2, (height/2)-100);
  textFont(f, 50);
  text("Final score: ", width/2, (height/2));
  text(game_score, (width/2)+ 170, (height/2));
  text("Click anywhere to restart the game", width/2, (height/2)+50);
}

//MOUSECLICKED FUNCTION
void mouseClicked()
{
  if (game.gameStart == false)
  {
    LevelPicked(mouseX, mouseY);
    game.gameStart = true;
  } else if (game.gameEnd == true)
  {
    game.gameEnd = false;
    game = null;
    setup();
    game.my_circle.alive = true;
  }
}
