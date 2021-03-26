# ASSIGNMENT FIVE: ARDUINO PUZZLE
- This assignment requires students to use arduino to make a puzzle that can be solved using at least three momentary switches and three LEDs.
- The puzzle should be somewhat complex, in that each switch should not simply control a particular LED, but rather do more than that.

## Description:
- In my puzzle, the user is prompted to select a word from a list of multiple choice words after they have been shown a description. For example:
    "Definition: The color of the sun "
    The user will be given 5 options and they should enter a number for the correct choice... in this case, yellow would be one of the options.

- Below are the instructions:
Instructions:
   1. A definition will be presented to you on the monitor.
   2. Enter your option (from 1 -5) of your guess for the described word in the buffer of the serial monitor
   3. The LEDs will flash either blue (for right) or red(for wrong)
   4. Click the red button to stop the red LED from blinking and to see how many trials you have left; the yellow LED will flash the number of trials you have left.
   5. If you get the guess right, the blue LED will flash until you click the blue switch to move on to the next part.

   - Do not enter 0 as an entry

## The process:
- I enjoyed the process for the most part. I had to rely on the arduino reference page, class readings, and recordings to ensure that I really understood what I was being required to do. Overall, I was able to create something easy and fun. I am not impressed with the outcome, however, because mainly... I have been having more difficulties with arduino compared to processing, the main reason for that being that I had already used processing before as a computer science student, but arduino was new... so I had to learn everything from scratch.I was pleased to learn that the syntax shares a lot of similarities with processing.

- I started with making a basic circuit and I had to figure out what my three LEDs would do, so I used a for loop to ensure that they would be able to blink thrice until a corresponding switch was on.

```Arduino
while ( digitalRead(redSwitch) == LOW) //if the red switch is not pressed ... 
  {
    for (int i = 0; i < 4; i++)
    {
      digitalWrite(redLed, HIGH);
      delay(150);
      digitalWrite(redLed , LOW);
      delay(150);
    }
    delay(300);
  }
```
## Difficulties:

## Interesting things that I discovered:

## Outcome:

## conclusion:

## Areas of improvement:


