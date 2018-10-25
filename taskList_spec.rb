# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
#
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
#
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.


require 'rspec'
require_relative 'taskList.rb'

describe Task do
  before do
    @task1 = Task.new("title", 'desc')
  end
  it "has to be real" do
    expect{Task.new("title","desc")}.to_not raise_error
  end
  it "can set its attributes" do
    expect(@task1.title).to eq "title"
    expect(@task1.desc).to eq 'desc'
    expect(@task1.done).to eq false
  end
  it "can be marked done" do
    @task1.is_done
    expect(@task1.done).to eq true
  end
  it "can print itself and show status" do
    expect(@task1.print_task).to eq "title: desc. Completed? false!"
    @task1.is_done
    expect(@task1.print_task).to eq "title: desc. Completed? true!"
  end
end

describe TaskList do
  before do
    @TaskList1 = TaskList.new
    @task1 = Task.new('title', 'desc')
    @task2 = Task.new('title', 'desc')
    @task3 = Task.new('title', 'desc')
    @testDate1 = DueDateTask.new("Take out trash","Don't be lazy","October 30th, 2018")
    @testDate2 = DueDateTask.new("Take out trash","Don't be lazy","October 28th, 2018")
  end
  it "has to be real" do
    expect{TaskList.new}.to_not raise_error
  end
  it "attributes start empty" do
    expect(@TaskList1.incomplete).to eq []
    expect(@TaskList1.complete).to eq []
  end
  it "can add a task to the incomplete array" do
    @TaskList1.add(@task1)
    @TaskList1.add(@task2)
    @TaskList1.add(@task3)
    expect(@TaskList1.incomplete).to eq [@task1, @task2, @task3]
  end
  it "can print incomplete array" do
    @TaskList1.add(@task2)
    expect(@TaskList1.print_incomplete).to eq ["title: desc. Due: 0 Completed? false!"]
  end
  #TODO test complete array once we make a method to do that
  it "Sorting incomplete tasks, prioritizes Due Dates" do
    @TaskList1.add(@task1)
    @TaskList1.add(@task2)
    @TaskList1.add(@testDate1)
    @TaskList1.sort_tasks
    expect(@TaskList1.print_incomplete).to eq ["Take out trash: Don't be lazy. Due: 2018-10-30 Completed? false!", "title: desc. Due: 0 Completed? false!","title: desc. Due: 0 Completed? false!"]
  end
end

describe DueDateTask do
  before do
    @DueDateTask1 = DueDateTask.new("title", "desc", "October 30th, 2018")
  end
  it "can print itself and show status" do
    expect(@DueDateTask1.print_task).to eq "title: desc. Due: 2018-10-30 Completed? false!"
    @DueDateTask1.is_done
    expect(@DueDateTask1.print_task).to eq "title: desc. Due: 2018-10-30 Completed? true!"
  end
end
