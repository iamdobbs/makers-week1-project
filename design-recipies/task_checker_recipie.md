{{TASK CHECKER}} Method Design Recipe

1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

User would like to check a string of text to confirm if the phrase #TODO is included. Allowing them to keep track of tasks.

2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.


outstanding_tasks = task_checker(string)

string: a string of text (e.g. "#TODO Pick up dog food.")
outstanding_tasks: returns a true or false value confirming if '#TODO' phrase is included.

The method returns true or false. If the user wanted to also view the task associated, we would need to write code to output the relevant string. Could also ammend to account for multiple instances of the phrase.

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

# EXAMPLE

task_checker("") => false
task_checker("This is an example of a false string") => false
task_checker("#TODO Pick up dog food") => true


Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.