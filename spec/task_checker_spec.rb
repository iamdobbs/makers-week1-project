require 'task_checker'

RSpec.describe 'task_checker method' do
  it 'return false if provided an empty string' do
    expect(task_checker('')).to eq false
  end   
  
  it 'return false if string doesn\'t include #TODO' do
    expect(task_checker('This is an example of a false string')).to eq false
  end 
  
  it 'return true if string includes #TODO' do
    expect(task_checker('#TODO Pick up dog food')).to eq true
  end  
end