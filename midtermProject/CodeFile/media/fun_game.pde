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


//GLOBAL VARIABLES
int game_score = 0;
int blocks_left = 5;
int numberOfWords = 0;
int total_points;
Word[] myWordsArray = new Word[71];
String words[];
ArrayList<Word> myScoredWords = new ArrayList<Word>();
Level_One play;// = new Level_One(1275, 750);
boolean gameProceed = false;


//SETUP FUNCTION
void setup()
{
  size(1275, 750); //set canvas size
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
    Word myNewWord = new Word(words[i], my_xPos, my_yPos, 10*(words[i].length()), 20, 73, 182, 237, my_speed);
    myWordsArray[i] = myNewWord;
  }

  String[] fontList = PFont.list();
  printArray(fontList);
}



//DRAW FUNCTION
void draw()
{
  smooth(); //smoothen out the sketches
  if (gameProceed == true)
  {
     play.showLevel(); //call the play object -> depends on the level selected
  }
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

  //check if the ball collides with the words
  boolean Knock()
  {
    //prepare a new array list to copy all the words not scored
    ArrayList<Word> myNewArray = new ArrayList<Word>();
    boolean check = false;

    //iterate through the array of words
    for (int i = 0; i < myWordsArray.length; i++)
    {
      float y_knockPoint = (myWordsArray[i].y_pos + myWordsArray[i].word_height);
      float x_knockPoint = (myWordsArray[i].x_pos + myWordsArray[i].word_width);
      if ((y_knockPoint >= y_pos - pRadius) && (y_knockPoint <= y_pos + pRadius) && (x_pos+pRadius >= myWordsArray[i].x_pos) && (x_pos - pRadius <= x_knockPoint ) )
      {
        game_score += myWordsArray[i].the_word.length();
        myScoredWords.add(myWordsArray[i]);
        check = true;
      } else
      {
        myNewArray. add(myWordsArray[i]);
      }
    }

    int count = 0;
    //paste all the new 
    for (Word myword : myNewArray)
    {
      myWordsArray[count] = myword;
      count++;
    }
    return check;
  }

  //check if any word has been lost
  boolean LostWords()
  {
    //prepare a new array to copy
    ArrayList<Word> myNewArray = new ArrayList<Word>();
    boolean check = false;

    //iterate through the array of words
    for (int i = 0; i < myWordsArray.length; i++)
    {
      if (myWordsArray[i].y_pos < height-100)
      {
        myNewArray.add(myWordsArray[i]);
      } else
      {
        if (blocks_left > 0)
        {
          blocks_left -= 1;
        } else if (blocks_left <= 0)
        {
          alive = false;
        }
        check = true;
      }
    }
    int count = 0;
    for (Word myword : myNewArray)
    {
      myWordsArray[count] = myword;
      count++;
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
    PImage my_platform = loadImage("media/platform_8.png");
    image(my_platform, x_pos, y_pos, pWidth, pHeight);
  }
}


//main class for all the word blocks
class Word
{
  //attributes
  float x_pos, word_width, word_height, word_colorR, word_colorG, word_colorB, word_speed;
  float y_pos;
  String the_word;

  //constructor
  Word(String aWord, float aXpos, float aYpos, float aWidth, float aHeight, float aColorR, float aColorG, float aColorB, float aSpeed)
  {
    the_word = aWord;
    x_pos = aXpos;
    y_pos = aYpos;
    word_width = aWidth;
    word_height = aHeight;
    word_colorR = aColorR;
    word_colorG = aColorG;
    word_colorB = aColorB;
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
    fill(word_colorR, word_colorG, word_colorB);
    rect(x_pos, y_pos, word_width, word_height);

    //typing the word
    PFont f = createFont("monaco", 15);
    textFont(f, 15);
    fill(255);
    textAlign(CENTER);
    text(the_word, x_pos+(word_width/2), y_pos + (3*(word_height/4)));
  }
}

//class level_frog
class Level_One
{
  //attributes
  float level_width, level_height;
  boolean gameStart = false;
  boolean gameEnd = true;
  int status;

  Player my_circle = new Player(25, 625, 50, 50, 10);

  //constructor method
  Level_One(float aWidth, float aHeight)
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
      gameStart = false;
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
      PImage my_cover = loadImage("media/pink_background.png");
      image(my_cover, 0, 0);
      showCover();
    } else if (gameStart == true)
    {
      checkWin();
      checkLoss();
      println ("alive: " + my_circle.alive + " left: " + blocks_left);

      PImage my_background = loadImage("media/blue_background.png");
      Platform my_platform = new Platform(0, height-100, width, 100);

      if (!(checkWin()) && !(checkLoss()))
      {
        //display the platform and show player
        image(my_background, 0, 0);
        my_circle.showPlayer();

        //show the words falling
        for (int i = 0; i < myWordsArray.length; i++)
        {
          myWordsArray[i].displayWord();
          myWordsArray[i].update();
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
    }
  }
}

void showCover()
{
  PFont f = createFont("monaco", 50);
  textFont(f, 50);
  fill(255, 255, 255, 60);
  rect((width/2)-200, (height/2)-150, 400, 100);
  //levels boxes
  rect((width/2)-220, (height/2)+20, 200, 40);
  rect((width/2)-220, (height/2)+70, 200, 40);
  rect((width/2)+20, (height/2)+20, 200, 40);
  rect((width/2)+20, (height/2)+70, 200, 40);

  fill(0);
  textAlign(CENTER);
  text("WORD GAME", width/2, (height/2)-75);
  textFont(f, 25);
  text("Click Anywhere to start", width/2, (height/2));
  textAlign(LEFT); 
  text("LEVEL ONE", (width/2)-200, (height/2)+50);
  text("LEVEL TWO", (width/2)+50, (height/2)+50);
  text("LEVEL THREE", (width/2)- 200, (height/2) + 100);
  text("LEVEL FOUR", (width/2) + 50, (height/2) + 100);
}

void EndCover()
{
  PImage my_image = loadImage("media/endpage.png");
  image(my_image, 0,0);
  //zapfino
  PFont f = createFont("Cochin", 150);
  textFont(f, 150);
  textAlign(CENTER);
  fill(0);
  text( "GAME OVER", width/2, height/2);
}

//MOUSECLICKED FUNCTION
void mouseClicked()
{
  gameProceed == true;
  if (play.gameEnd == true)
  {
    Level_One play = new Level_One(1275, 750);
    //play.gameEnd = false;
    //starts the game when mouse is clicked
    if (play.gameStart == false)
    {
      play.gameStart = true;
    }
  } else
  {
    if (play.gameStart == false)
    {
      play.gameStart = true;
    }
  }
}
