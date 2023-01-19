Method Design Recipe

1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

(In other words) - User would like to input a block of text and get the estimated time it would take to read this text, if their reading speed is 200WPM


2. Design the Method Signature
 Include the name of the method, its parameters, return value, and side effects.

The method will return the length of time to read the inputted text 

reading_time = def reading_calc(text)

text: A string or block of text (e.g "Hello world, it is me Abi. This is my test case for the reading time method in ruby at Makers.")
reading_time = The length of time in minutes to read the given text (e.g. "1 minute")

The method does only return length in minutes, so for very long text may need to be altered for hours 


3. Create Examples as Tests
Make a list of examples of what the method will take and return.

reading_calc("") => "0 minutes" 
reading_calc("Hello world") => "1 minute"




4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

def reading_calc