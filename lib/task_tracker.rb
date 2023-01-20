class TaskTracker
  def initialize
    @list = []
  end  

  def add(todo)
    @list << todo
  end
  
  def complete(todo)
    fail "Task not in your list." unless @list.include?(todo)
    @list.delete(todo)
  end
  
  def list
    return @list
  end  
end
