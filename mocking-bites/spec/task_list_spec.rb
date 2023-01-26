require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it 'returns list of tasks' do
    task_list = TaskList.new
    task_1 = double :task
    task_list.add(task_1)
    expect(task_list.all).to eq [task_1]
  end  

  context 'checks the all_complete? method' do
    it 'returns false if @tasks empty' do
      task_list = TaskList.new
      expect(task_list.all_complete?).to eq false
    end
    
    it 'returns'
  end
end