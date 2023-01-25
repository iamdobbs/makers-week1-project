require 'todo'

RSpec.describe 'initially' do
  it 'returns the task passed at initialisation' do
    todo = Todo.new('walk the dog')
    expect(todo.task).to eq 'walk the dog'
  end

  it 'marks task as complete' do
      todo = Todo.new('walk the dog')
      expect(todo.mark_done!).to eq true
  end
end