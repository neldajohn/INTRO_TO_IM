## MY MIDTERM PROJECT JOURNAL

#### Goal:
With my midterm project, I am planning to create a word game that will involve words falling from the sky and a character collecting the words. This game was inspired by a game that I used to play in elementary school during my Typing class sessions. We were given short prompts that we had to type into the computer, and once we were done, we were allowed to play the game. The difference between that game and mine is that in mine, players have to jump and move around to collect the words, but in my elementary school typing class, players had to type in the words they see. 

I could not find the game online, so I cannot directly atach a link. However, I would still like to acknowledge that this is not fully my idea. 

### JOURNAL ENTRIES

#### Thursday 18th February, 2021
Today, I focused on three main things:
- To get a proper layout of my program. 
  - To do this, I opened a new document and I decided to add in a decsription of my program (that includes my name, date created, last modified, as well as a simple description of what the program does and any instructions to the user. 
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
```

  - Next, I decided to add skeletons of the main functions and classes that I would need in the program. This was just to help me have an idea of how much work I would need to do, so that I could plan ahead. The final code I had on day one was:
```Processing

//global variables
/*
wordsArray 
gameScore
blocksLeft
numberOfWords
*/

void setup()
{
size(1280,720);
}

void draw()
{
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

