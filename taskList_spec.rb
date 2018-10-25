# Story: As a developer, I can create a Task.
#
# Story: As a developer, I can give a Task a title and retrieve it.
#
# Story: As a developer, I can give a Task a description and retrieve it.
#
# Story: As a developer, I can mark a Task done.
#
# Story: As a developer, when I print a Task that is done, its status is shown.
#
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
#
# Story: As a developer with a TaskList, I can get the completed items.
#
# Story: As a developer with a TaskList, I can get the incomplete items.


require 'rspec'
require_relative 'taskList.rb'

describe Task do
  before do
    @task1 = Task.new("myTask", 'desc')
  end
  it "has to be real" do
    expect{Task.new("title","desc")}.to_not raise_error
  end
  it "can set its attributes" do
    expect(@task1.title).to eq "myTask"
    expect(@task1.desc).to eq 'desc'
    expect(@task1.done).to eq false
  end
  it "can be marked done" do
    @task1.is_done
    expect(@task1.done).to eq true
  end
  it "can print itself and show status" do
    expect(@task1.print_task).to eq "Status: INCOMPLETE! Fix your life!!!"
    @task1.is_done
    expect(@task1.print_task).to eq "Status: Complete!"
  end
end

describe TaskList do
  before do
    @TaskList1 = TaskList.new
    @task1 = Task.new('title', 'desc')
    @task2 = Task.new('title', 'desc')
    @task3 = Task.new('title', 'desc')
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
end
