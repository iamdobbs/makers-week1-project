{{PROBLEM}} Method Design Recipe

1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

. ! ?

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

  correct_grammar = grammar_check(string)

  string: a string (e.g. "Hello friends!)
  correct_grammar: returns "That sentence has correct grammar!" if true; else fails and returns an error message "That sentence does not have correct grammar, try another." 

This method only checks one sentence, so would need to be altered for text with multiple correct sentences. 

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

# EXAMPLE

grammar_check("") => "That's not a complete sentence."
grammar_check("The dog was barking.") => "That sentence has correct grammar." 
grammar_check("the dog was barking.") => "That sentence does not have correct grammar, try another."
grammar_check("The dog was barking") => "That sentence does not have correct grammar, try another."
grammar_check("the dog was barking") => "That sentence does not have correct grammar, try another."

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
