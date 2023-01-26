require 'todo_list'
require 'todo'

RSpec.describe 'initially' do
  it 'initialises new class of TodoList' do
    todo = TodoList.new
    result = todo.add('walk the dog')
    expect(result).to eq ['walk the dog']
  end

  it 'returns incomplete todos' do
    todo_list = TodoList.new
    todo_1 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    expect(todo_list.incomplete).to eq [todo_1]
  end  

  it 'returns complete todos' do
    todo_list = TodoList.new
    todo_1 = Todo.new('wash the dishes')
    todo_2 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_1.mark_done!
    expect(todo_list.complete).to eq [todo_1]
  end  

  it 'returns completed and incomplete todos' do
    todo_list = TodoList.new
    todo_1 = Todo.new('wash the dishes')
    todo_2 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_1.mark_done!
    expect(todo_list.complete).to eq [todo_1]
    expect(todo_list.incomplete).to eq [todo_2]
  end

  it 'checks all tasks marked as complete when give up method called' do
    todo_list = TodoList.new
    todo_1 = Todo.new('wash the dishes')
    todo_2 = Todo.new('walk the dog')
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    expect(todo_list.give_up!).to eq todo_list.complete
  end  
end    

    