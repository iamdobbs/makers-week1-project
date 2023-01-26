# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries
As a user

So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
As a user

So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

REFRAME: Record experiences to diary, reflect/read entries, conditionally read entries based on available time, tracks tasks in a todolist, track and view contacts within diary entries.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ Diary                      │
│                            │
│ - add(entry)               │
│ - all                      │
│ - count words              |
| - best reading time        │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ DiaryEntry              │
│                         │
│ - title                 │
│ - contents              │
│ - reading time          |
| - count                 │
└─────────────────────────┘

┌────────────────────────────┐
│ Todo List                  │
│                            │
│ - add(entry)               │
│ - all                      │
│ - completion?              |
| - search => contacts       |   
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Todo                    │
│                         │
│ - add(todo)             │
│ - completion?           │                
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # stores diary entries
  end

  def add(entry) 
    # adds entries to a list
  end

  def all
    # returns diary entries
  end

  def count_words
    # returns a count of the words in the diary entries
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # returns to best entry for reading in the given parameters
  end  

  def contacts_search
    # returns contacts based on numerical search
  end

  class DiaryEntry
  def initialize(title, contents)
    # starts class instance by taking title and contents
    # store here
  end

  def title
    # returns entry title
  end

  def contents
    # returns entry contents
  end

  def count_words
    # counts words of inividual entry
  end

  def reading_time(wpm) 
    # returns calculation of entry reading time
  end

class TodoList
  def initialize
    # store todo list tasks
  end

  def add(todo) 
    # adds todo to list
  end

  def incomplete
    # determines todo status
  end

  def complete
    # determines todo status 
  end

end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

    # lists all entries
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The Contents')
    diary_entry2 = DiaryEntry.new('Title 2', 'The Contents 2')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    diary.all # => [diary_entry1, diary_entry2]

    # finds the most suitable reading entry
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary.add(diary_entry1)
    diary.find_best_entry_for_reading_time(2, 3) # => diary_entry1
    
    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry2 = DiaryEntry.new('Title 2', 'The contents are more than six words long and not applicable in this test')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    diary.find_best_entry_for_reading_time(2, 3) # => diary_entry1

    diary = Diary.new
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry2 = DiaryEntry.new('Title 2', 'This contents total is five.')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    diary.find_best_entry_for_reading_time(2, 3) # => diary_entry1

    # initialises new class and returns task
    todo = TodoList.new
    todo.add('walk the dog') # => ['walk the dog']

    # returns incomplete todos
    todo_list = TodoList.new
    todo_1 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    todo_list.incomplete # => [todo_1]

    # returns complete todos
    todo_list = TodoList.new
    todo_1 = Todo.new('wash the dishes')
    todo_2 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_1.mark_done!
    todo_list.complete # => [todo_1]

    # returns both complete and incomplete todos
    todo_list = TodoList.new
    todo_1 = Todo.new('wash the dishes')
    todo_2 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_1.mark_done!
    todo_list.complete # => [todo_1]
    todo_list.incomplete # => [todo_2]

    # returns array of phone numbers pulled from diary entries
    diary = Diary.new  
    diary_entry1 = DiaryEntry.new('Title 1', 'The contents are six words long')
    diary_entry2 = DiaryEntry.new('Title 2', 'The contents hold the phone number 07703112233.')
    diary_entry3 = DiaryEntry.new('Title 2', 'The contents hold the phone number 07703332211.')
    diary_entry4 = DiaryEntry.new('Title 2', 'The contents hold the phone number 07700001111, 07711445566.')
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    diary.add(diary_entry3)
    diary.add(diary_entry4)
    diary.phone_extract # => ['07703112233', '07703332211', '07700001111', '07711445566']
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
    # creates new class instance and empty array for storing entries
    diary = Diary.new
    diary.all # => []
  
    # checks word count of all entries
    diary = Diary.new
    diary.count_words #=> 0

    # creates a new diary entry
    diary_entry = DiaryEntry.new('My Title', 'My Contents')
    diary_entry.title # => 'My Title'
    diary_entry.contents # => 'My Contents'

    # calculates reading time
    diary_entry = DiaryEntry.new("My Title", "My Contents")
    diary_entry.reading_time(0) #=> to raise_error "WPM must be a positive number" 

    diary_entry = DiaryEntry.new("My Title", "")
    diary_entry.reading_time(10) #=> 0

    diary_entry = DiaryEntry.new("My Title", "My Contents")
    diary_entry.reading_time(10) # => 1

    # counts words in entry
    diary_entry = DiaryEntry.new('Today', '')
    diary_entry.count_words # => 0
  
    diary_entry = DiaryEntry.new('Today', 'We')
    diary_entry.count_words # => 1

    diary_entry = DiaryEntry.new('Today', 'We are pair programming')
    diary_entry.count_words # => 4

    # returns task passed at initialisation
    todo = Todo.new('walk the dog')
    todo.task # => 'walk the dog'

    # marks tasks as complete
      todo = Todo.new('walk the dog')
      todo.mark_done! # => true
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
