/*
Name: Nelda John
Date created: 21-01-2021
Last modified: 25-01-2021
Description:
  This is my first assignment in the Introduction to IM course:
    - This code displays Nelda's self-portrait using the different 2D shapes
*/


      //determine the canvas size
size(600,600);
      //determine background color
background(100,10,10);
//body elements
fill(82,42,42);
rect(52,510,30,110);
stroke(1);
triangle(72,487,300,420,526,487);
rect(518,510,30,110);

//HAIR
   fill(0,0,0); 
ellipse(550,500,100,50); //dress cup sleeves
ellipse(50,500,100,50); // dress cup sleeves
//big hair   
ellipse(300,200,400,300);
ellipse(200,350,200,200);
ellipse(400,350,200,200);
//more hair
ellipse(150,300,200,200);
ellipse(150,200,200,200);
ellipse(200,150,200,200);
  //round hair pattern
ellipse(450,300,200,200);
ellipse(450,200,200,200);
ellipse(400,150,200,200);
  //mid hair 
ellipse(300,130,200,200);


//BODY PARTS
fill(82,42,42); //fill brown for skin features 
    //ears
strokeWeight(4);
ellipse(170,280,80,80); //left ear
ellipse(430,280,80,80); //right ear

    //face shape
ellipse(300,300,280,320);

    //the eyes area
noFill();

    //eyebrows
strokeWeight(8);
arc (240,250,90,30,radians(210),radians(330));
arc (360,250,90,30, radians(210), radians(330));
strokeWeight(4);

    //eyes
fill(255,255,255);
ellipse(240,260,80,30);
ellipse(360,260,80,30);

    //iris
fill(0,0,0);
ellipse(240,260,30,30);
ellipse(360,260,30,30);


    //nose
    noFill();
arc (300,315,30,20,radians(210),radians(330));
arc (300,335,40,25,radians(10),radians(180));
arc (280, 330, 20,30, radians(70), radians(270));
arc (320, 330, 20,30, radians(-90), radians(110));

    //lips
arc(280,390,49,15, radians(180), radians(320));
arc(320,390,49,15, radians(210), radians(360));
arc(300,390,90,10, radians(5), radians(180));
arc(300,390,90, 50, radians(5), radians(180));

  //outer bubbles of the hair pattern
fill(0,0,0);
ellipse(300,150,100,100);
ellipse(200,150,100,100);
ellipse(400,150,100,100);

  //body
  fill(0,0,0);
line(70,489,230,440);
line(370,440,530,489);
arc(75,540,50,100, radians(170), radians(280));
line(50,550,50,600);
line(550,550,550,600);
arc(525,540,50,100, radians(260), radians(370));
noStroke();
rect(80,485,439,120);

