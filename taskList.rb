class Task
  attr_accessor :title, :desc, :done
  def initialize(title, desc)
    @title = title
    @desc = desc
    @done = false
  end

  def is_done
    @done = !@done
  end

  def print_task
    p "#{@title}: #{@desc}"
    if @done == true
      "Status: Complete!"
    else
      "Status: INCOMPLETE! Fix your life!!!"
    end
  end

end

class TaskList
  attr_accessor :incomplete, :complete
    def initialize
      @incomplete = []
      @complete = []
    end

    def add(task)
      # if task.respond_to?(@done)
        @incomplete << task
      # end
    end

    def print_incomplete
      @incomplete.each do |el|
        p "#{el.title}: #{el.desc}. Completed? #{el.done}"
      end
    end

    def print_complete
      @complete.each do |el|
        p "#{el.title}: #{el.desc}. Completed? #{el.done}"
      end
    end
end


tasklist1 = TaskList.new
tasklist1.print_complete()
task2 = Task.new("Fold Laundry", "Don't let it get wrinkly")
tasklist1.add(task2)
tasklist1.print_incomplete
