require 'task_tracker'

RSpec.describe TaskTracker do
  context 'no tasks given' do
    it 'returns empty list' do
      todo_list = TaskTracker.new
      expect(todo_list.list).to eq []
    end
  end  
  
  context 'a task given' do
    it 'adds todo task to list' do
      todo_list = TaskTracker.new
      todo_list.add('wash the dishes')
      expect(todo_list.list).to eq ['wash the dishes']
    end
  end    

  context 'two tasks given' do
    it 'adds two todo tasks to list' do
      todo_list = TaskTracker.new
      todo_list.add('wash the dishes')
      todo_list.add('pick up dry cleaning')
      expect(todo_list.list).to eq ['wash the dishes', 'pick up dry cleaning']
    end
  end   

  context 'deletes from the todo list' do
    it 'deletes the task if it exists' do
      todo_list = TaskTracker.new
      todo_list.add('wash the dishes')
      todo_list.add('pick up dry cleaning')
      todo_list.complete('wash the dishes')
      expect(todo_list.list).to eq ['pick up dry cleaning']
    end
    it 'fails if task doesn\'t exist' do
      todo_list = TaskTracker.new
      todo_list.add('wash the dishes')
      todo_list.add('pick up dry cleaning')
      expect {todo_list.complete('walk the dog')}.to raise_error  "Task not in your list."
    end  
  end    
end