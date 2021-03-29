## ASSIGNMENT FIVE: ANALOG INPUT AND OUTPUT
- This assignment requires students to use at least one analog sensor and one digital sensor to control at least 2 LEDS in some creative fashion.
- I decided to create a project that is inspired by something that I have been learning recently : Meditation. A huge part of the meditation practice is breathing, so in my program, the user has four different breathing techniques that they can access through the control of either a digital sensor (switch), an analog sensor (light sensor), or both.  

## Description:
- Once the program starts, all LEDs are off until a sw. 
- The best part about this program is that it helps the user focus on colors, which is also a nice technique in calming anxiety. 

## Schematic:

## The process:
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

