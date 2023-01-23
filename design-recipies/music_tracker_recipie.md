{{MusicTracker}} Class Design Recipe

1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

User wants to be able to input tracks they are listening to and recall a list of them.

2. Design the Class Interface

Include the initializer and public methods with all parameters and return values.

The MVP here is to be able to add tracks to a list and recall them. It doesn't include the option to remove tracks or view by artist or other variables. It will also return the tracks, but is not designed to output these in a specific user-friendly format. This could further be achieved by using a Hash. 

class MusicTracker
  def initialize
    # initializes class and creates array for list
  end

  def add(track) # track is a string
    # Adds track to list
  end

  def list
    # Raise error if list empty
    # Otherwise, returns array list of tracks
  end
end

3. Create Examples as Tests

Make a list of examples of how the class will behave in different situations.

# EXAMPLE

# 1
tracker = MusicTracker.new
tracker.add('The APX - Lose Yourself To The Groove') => ['The APX - Lose Yourself To The Groove']

# 2
tracker = MusicTracker.new
tracker.list => "No tracks in list!"

# 3
tracker = MusicTracker.new
tracker.add('The APX - Lose Yourself To The Groove')
tracker.list => ['The APX - Lose Yourself To The Groove']

# 4
tracker = MusicTracker.new
tracker.add('The APX - Lose Yourself To The Groove')
tracker.add('Daft Punk - Solar Sailer')
tracker.list => ['The APX - Lose Yourself To The Groove', 'Daft Punk - Solar Sailer']

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.