/*
Name: Nelda John
 Date created: 14-02-2021
 Last modified: 15-02-2021
 Due date: 16-02-2021
 Description:
 This is my third assignment in the Introduction to IM course:
 - This code displays Nelda's application of data visualization
 Usage:
 - Initially, a cover is displayed while the data is loading. Do not worry, the graph will show up.
 - I borrowed the rotating wheel code from the example we used in class
 */

//global variables
String openingLine = "Nelda's spending habits: A Demonstration";
String strings[];

int row_num;
int janTotal, febTotal, marTotal, aprTotal, mayTotal, junTotal, julTotal, augTotal, sepTotal, octTotal, novTotal, decTotal;

//the setup function
void setup()
{
  size(1060, 800); // set the size of the canvas
  background(255); //set the background color
  strings = loadStrings("data.csv"); //load all the rows into an array of strings
}

//the draw function
void draw()
{
  smooth();
  //declare variables
  String mydata[];
  stroke(255);
  color myFavoriteColor = color(255, 0, 0);
  int currentMonth;
  int dummyvalue = 0; // dummy value for the else statement

  //create an obejct of the PFont class to print the welcome message
  PFont f = createFont("monaco", 28);
  textFont(f, 28);
  fill(myFavoriteColor);
  //fill(0);
  textAlign(CENTER);
  //print out the message
  text(openingLine, width/2, height/10);
  text("The data is loading...", (width/2), (height/10)+50);

  //create an object of the PImage class to display image
  PImage mycat = loadImage("cat.png");
  image(mycat, (width/2)-100, (height/10)+100);
  
  //more text
  textFont(f, 20);
  text("This program used data from mealplans.nyu.edu.", (width/2), (height/2)+100);
  text("All of Nelda's expenses from March 2020 to February 2021 have been recorded.", (width/2),(height/2)+130);
  text("The data will be represented in a bar graph shortly.", (width/2), (height/2)+160);
  noStroke();
  if (frameCount % 10 == 0) {
    fill(frameCount * 3 % 255, frameCount * 5 % 255, 
      frameCount * 8 % 255);
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 2  % 360));
    rect(0, 0, 80, 20);
    popMatrix();
  }

  //start a new array of each row split according to commas
  mydata = split(strings[row_num], ',');
  String month_data = mydata[0]; //get the month data only from the first item in the array
  int moneySpent = (-1) * (int (mydata[2])); //negate all the values because they are recorded as negative values

  //slice the month data string for either 1 or 2 digits depending on the month
  if (month_data.length() == 17)
  {
    currentMonth = int(month_data.substring(0, 1));
  } else
  {
    currentMonth = int(month_data.substring(0, 2));
  }

  //sum all the charges depending on the month (only for values greater than 0)
  if (moneySpent >= 0)
  {
    if (currentMonth == 1) // january
    {
      janTotal+= moneySpent;
    } else if (currentMonth == 2) //february
    {
      febTotal += moneySpent;
    } else if (currentMonth == 3) //march
    {
      marTotal += moneySpent;
    } else if (currentMonth == 4) //april
    {
      aprTotal += moneySpent;
    } else if (currentMonth == 5) //may 
    {
      mayTotal += moneySpent;
    } else if (currentMonth == 6) //june
    {
      junTotal += moneySpent;
    } else if (currentMonth == 7) //july
    {
      julTotal += moneySpent;
    } else if (currentMonth == 8) //august
    {
      augTotal += moneySpent;
    } else if (currentMonth == 9) //september
    {
      sepTotal += moneySpent;
    } else if (currentMonth == 10) //october
    {
      octTotal += moneySpent;
    } else if (currentMonth == 11) //november
    {
      novTotal += moneySpent;
    } else if (currentMonth == 12) //december
    {
      decTotal += moneySpent;
    }
  } else
  {
    dummyvalue ++; //else just add up the dummy value
  }

  //use an if statement to check if the parsing has reached the last row
  if (row_num < strings.length - 1)
  {
    row_num ++; //move to the next line
  } else
  { 
    noLoop(); //stop the loop
    drawGraph(); //call the drawGrpah() function
  }
}



//the drawGraph() function
void drawGraph()
{
  //declare variables
  int startingPoint = 50;
  fill(255);
  stroke(0);
  rect(0, 0, width, height); //draw a huge rect to clear the background
  stroke(0);
  line(startingPoint, 10, startingPoint, height-10); //draw the y-axis
  line(10, height-50, width-10, height-50); //draw the x-axis

  //create a new PFont object for text
  PFont f = createFont("monaco", 15);
  textFont(f, 15);
  color myFavoriteColor = color(255, 0, 0);
  fill(myFavoriteColor);
  textAlign(CENTER);

  //label the x-axis with all the months in their order
  text("Jan", startingPoint + 40, height-25);
  text("Feb", startingPoint + 120, height-25);
  text("Mar", startingPoint + 200, height-25);
  text("Apr", startingPoint + 280, height-25);
  text("May", startingPoint + 360, height-25);
  text("Jun", startingPoint + 440, height-25);
  text("Jul", startingPoint + 520, height-25);
  text("Aug", startingPoint + 600, height-25);
  text("Sep", startingPoint + 680, height-25);
  text("Oct", startingPoint + 760, height-25);
  text("Nov", startingPoint + 840, height-25);
  text("Dec", startingPoint + 920, height-25);

  //declare the proportion
  float myProportion = 0.571895425; //(gotten by dividing 700 by the highest total
  println(myProportion);
  fill(myFavoriteColor);

  //draw the bars for each month and type the total number just above the respective bars
  for (int i=1; i < 13; i++)
  {
    if (i == 1) //january
    {
      rect(startingPoint+10, (height-50)-(janTotal*myProportion), 60, (janTotal * myProportion) );
      text(janTotal, startingPoint + 40, ((height-50)-(janTotal*myProportion))-5);
    } else if (i == 2) //february
    {
      rect(startingPoint+90, (height-50)-(febTotal*myProportion), 60, (febTotal* myProportion));
      text(febTotal, startingPoint+120, ((height-50)-(febTotal*myProportion))-5);
    } else if (i == 3) //march
    {
      rect(startingPoint+170, (height-50)-(marTotal*myProportion), 60, (marTotal* myProportion));
      text(marTotal, startingPoint+200, ((height-50)-(marTotal*myProportion))-5);
    } else if (i == 4) //april
    {
      rect(startingPoint+250, (height-50)-(aprTotal*myProportion), 60, (aprTotal* myProportion));
      text(aprTotal, startingPoint+ 280, ((height-50)-(aprTotal*myProportion))-5);
    } else if (i == 5) //may
    {
      rect(startingPoint+330, (height-50)-(mayTotal*myProportion), 60, (mayTotal * myProportion) );
      text(mayTotal, startingPoint+360, ((height-50)-(mayTotal*myProportion))-5);
    } else if (i == 6) //june
    {
      rect(startingPoint+410, (height-50)-(junTotal*myProportion), 60, (junTotal* myProportion));
      text(junTotal, startingPoint+440, ((height-50)-(junTotal*myProportion))-5);
    } else if (i == 7) //july
    {
      rect(startingPoint+490, (height-50)-(julTotal*myProportion), 60, (julTotal* myProportion));
      text(julTotal, startingPoint+520, ((height-50)-(julTotal*myProportion))-5);
    } else if (i == 8) //august
    {
      rect(startingPoint+570, (height-50)-(augTotal*myProportion), 60, (augTotal* myProportion));
      text(augTotal, startingPoint+600, ((height-50)-(augTotal*myProportion))-5);
    } else if (i == 9) //september
    {
      rect(startingPoint+650, (height-50)-(sepTotal*myProportion), 60, (sepTotal * myProportion) );
      text(sepTotal, startingPoint+680, ((height-50)-(sepTotal*myProportion))-5);
    } else if (i == 10) //october
    {
      rect(startingPoint+730, (height-50)-(octTotal*myProportion), 60, (octTotal* myProportion));
      text(octTotal, startingPoint+760, ((height-50)-(octTotal*myProportion))-5);
    } else if (i == 11) //november
    {
      rect(startingPoint+810, (height-50)-(novTotal*myProportion), 60, (novTotal* myProportion));
      text(novTotal, startingPoint+840, ((height-50)-(novTotal*myProportion))-5);
    } else if (i == 12) //december
    {
      rect(startingPoint+890, (height-50)-(decTotal*myProportion), 60, (decTotal* myProportion));
      text(decTotal, startingPoint+920, ((height-50)-(decTotal*myProportion))-5);
    }
  }
}
