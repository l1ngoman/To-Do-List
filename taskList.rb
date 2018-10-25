require 'date'
class Task
  attr_accessor :title, :desc, :done, :date
  def initialize(title, desc)
    @title = title
    @desc = desc
    @done = false
    @date = 0
  end

  def is_done
    @done = !@done
  end

  def print_task
    msg = "#{@title}: #{@desc}. Completed? #{@done}!"
    p msg
    msg
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
      msg_arr = []
      @incomplete.each do |el|
        msg_arr << "#{el.title}: #{el.desc}. Due: #{el.date} Completed? #{el.done}!"
      end
      p msg_arr
      return msg_arr
    end

    def print_complete
      msg_arr = []
      @complete.each do |el|
        msg_arr << "#{el.title}: #{el.desc}. Due: #{el.date} Completed? #{el.done}!"
      end
      p msg_arr
      return msg_arr
    end
    # def sort_tasks
    #   @incomplete.sort! { |task| task.date }
    #   i = 0
    #   while @incomplete[i] == 0
    #     @incomplete << @incomplete.shift
    #     i += 1
    #   end
    #
    # end

end

class DueDateTask < Task
  attr_accessor :date
  def initialize(title, desc, date) #date object
    super(title, desc)
    @date = Date.parse(date)
  end

  def print_task
    msg = "#{@title}: #{@desc}. Due: #{@date} Completed? #{@done}!"
    p msg
    msg
  end
end


tasklist1 = TaskList.new
task2 = Task.new("Fold Laundry", "Don't let it get wrinkly")
testDate = DueDateTask.new("Take out trash","Don't be lazy","October 30th, 2018")
testDate2 = DueDateTask.new("Take out trash","Don't be lazy","October 28th, 2018")
tasklist1.add(task2)
tasklist1.add(testDate)
tasklist1.add(testDate2)
tasklist1.sort_tasks
tasklist1.print_incomplete
