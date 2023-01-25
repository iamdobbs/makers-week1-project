class TodoList
  def initialize
    @todolist = []
  end

  def add(todo) 
    @todolist << todo
  end

  def incomplete
    @todolist.filter { |todo| !todo.done? }
  end

  def complete
    @todolist.filter { |todo| todo.done? }   
  end

  def give_up!
    @todolist.each { |todo| todo.mark_done! }
  end
end