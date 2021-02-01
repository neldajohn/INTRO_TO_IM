/*
Name: Nelda John
Date created: 01-02-2021
Last modified: 01-02-2021
Description:
  This is my second assignment in the Introduction to IM course:
    - This code displays Nelda's work of art. 
*/

//setup function
void setup()
{
  size(600,600); //determine the size of the canvas
  background(0); //set the background to black
  strokeWeight(1); //pick strokeweight of 1
}


//draw function
void draw()
{
  int framesCount = frameCount % 8; // use frameCount to produce a disco effect
  //use an if statement to vary colors by frameCount
  if (framesCount == 0)
  {
    Red(); 
  }
  if (framesCount == 1)
  {
    Orange();
  }
  else if (framesCount == 2)
  {
    Yellow();
  }
  else if (framesCount == 3)
  {
    Green();
  }
  else if (framesCount == 4)
  {
    Blue();
  }
  else if (framesCount == 5)
  {
    Indigo();
  }
  else if (framesCount == 6)
  {
    Violet();
  }
}

//Red Strokes Function
void Red()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(222,22,22);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      { 
        line(0,0,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
  
}

//Orange Strokes Function
void Orange()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(229,136,21);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      {
        line(50,0,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
}

//Yellow Strokes Function
void Yellow()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(237,245,22);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      {
        line(0,0,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
}

//Green Strokes Function
void Green()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(16,224,27);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      {
        line(0,50,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
}

//Blue Strokes Function
void Blue()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(5,15,255);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      {
        line(0,0,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
}

//Indigo Strokes Function
void Indigo()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(29,0,51);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      {
        line(50,0,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
}

//Violet Strokes Function
void Violet()
{
  int xPosition = 0;
  int yPosition = 0;
  stroke(56,0,100);
  for (int j = xPosition; j < (width - xPosition); j = j + 60)
    {
      for (int k = yPosition; k < (height - yPosition); k = k + 60)
      {
        line(0,0,j,k);
        line(150,150,j,k);
        line(250,250,j,k);
        line(350,350,j,k);
        line(450,450,j,k);
        line(600,600,j,k);
      }
      xPosition += 2;
      yPosition += 2;
    }
}
