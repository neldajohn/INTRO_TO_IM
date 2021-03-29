## ASSIGNMENT FIVE: LED-GUIDED BREATHING
- This assignment requires students to use at least one analog sensor and one digital sensor to control at least 2 LEDS in some creative fashion.
- I decided to create a project that is inspired by something that I have been learning recently : Meditation. A huge part of the meditation practice is breathing, so in my program, the user has four different breathing techniques that they can access through the control of either a digital sensor (switch), an analog sensor (light sensor), or both.  

## Description:
- Once the program starts, all LEDs are off until a switch is turned on. Once the switch is turned on, the deafult breathing technique is the 4 seconds by 4 seconds technique. So, all three LEDs will fade in a 4 by 4 rhythm to allow the user to follow along. This technique is used to help improve focus. 
- If the user wants to try a different technique, all they have to do is block the light sensor and that will introduce the second part of the program, i.e. the 4 seconds by 7 seconds by 8 seconds breathing technique. This technique is used to help to ground people when they get anxious... and as a naturally anxious person, I have used this technique before, and it works great. It is also the same technique I use when meditating, because it helps me concentrate on the present and not worry about other things e.g future exams.
- 
- The best part about this program is that it helps the user focus on colors, which is also a nice technique in calming anxiety i.e. when getting anxious... people are encouraged to focus on their senses... and sight is a good sense to focus on. 

## Schematic:

## The process:
- I had no idea what I was going to do when I started with the program, so initially I just put my switch and sensor, and made sure that they work to control the switches... which turned out fine. But I did not use any of that ground work in my final project... it was just a way to help me set up everything.

- I had to change my outputs, because I had initially used some digital-only outputs... but since I was going to use analog as well, I went back into my program and picked 9,6,3 for my LEDs to enable analog output too.

- I then set up the part that when the sensor detects anything above 400, the user can do the 4 by 4 breathing technique. This was achieved by:
```Arduino
if (sensorValue > 400)
    {
              //4 sec by 4 sec breathing
      analogWrite(BLUE_LED, (brightness/3));
      analogWrite(RED_LED, (brightness/3));
      analogWrite(YELLOW_LED, (brightness/3));

      brightness = brightness + fadeAmount;

      if (brightness <= 0 || brightness >= 255) {
        fadeAmount = -fadeAmount;
      }
      delay(400); 
```

- If the user blocks some light and the sensor value goes below 400, the user can switch to the 4 by 7 by 8 breathing technique. Given that this is somewhat more complicated, this time, the Blue light will blink 4 times to indicate that the user should breathe in, and the Red light will blink 7 times for the user to hold their breathe, and then the yellow light will blink 8 times for the user to breathe out. Below, here is the code:
```Arduino
for (int i = 0; i < 4; i++)
      {
        digitalWrite(BLUE_LED, HIGH);
        delay(200);
        digitalWrite(BLUE_LED, LOW);
        delay(200);
      }

      for (int i = 0; i < 7; i++)
      {
        digitalWrite(RED_LED, HIGH);
        delay(200);
        
        digitalWrite(RED_LED, LOW);
        delay(200);
      }

      for (int i = 0; i < 8; i++)
      {
        digitalWrite(YELLOW_LED, HIGH);
        delay(200);
        digitalWrite(YELLOW_LED, LOW);
        delay(200);
      }

```
- I then combined the two parts, so that whenever someone clicked on the switch, they would be prompted to go to the 4 by 4 technique, and if they blocked the light sensor, they would be directed to the 4 by 7 by 8 technique.

## Difficulties and Solutions:
- I did not face many challenges in this assignment, but this is mainly because I was able to read through the readings properly and to follow the examples in class. I was able to understand exactly how to incorporate the different aspects of both digital and analog outputs and inputs. 
- Despite all this, I still struggled with the fade example, because I couldn't figure out the differeny elements that control how bright and how fast the LED lights would fade. Frankly... I still don't, but I did trial and error with several numbers until I got one that actually matched the 4 by 4 breathing pattern that I was looking for.

## Interesting things I discovered:
- Not that this is something new... but I realized that I hadn't saved the fade example after we looked at it in class, and I was getting anxious thinking about it, and then I remembered that I could easily just look it up from the examples folder. I didn't know exactly where it was... so I just followed my instincts and started with Basics and it was right there. I was also able to explore other examples that I wanted to use for my project, but I settled for fade.

## Outcome:
 - Below is a link to the video showing how the program works. 
 
## Conclusion:
I am happy with my outcome, especially because I think it is very useful. I can actually see this becoming useful to people. If this gets turned into a device, it could help so many people whenever they are anxious. With a couple modifications... this could be compacted into a tool to help people overcome anxiety and potentially fight panic attacks. I have used these breathing techniques... and I know that they work. Even more, I think that this project is useful... because it can help children, people with learning disabilities, the elderly... and many other people who need just simple things to overcome anxiety.

