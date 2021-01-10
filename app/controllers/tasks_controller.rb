class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :show, :destory]

  def create
  end

  def index
    @tasks = Task.all()
  end
  
  def show
    @task = find_task()
  end
  
  def new
    @task = Task.new()
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = find_task()
  end

  def update
    @task = find_task()
    @task.update(task_params)
    redirect_to task_path(params[:id])
  end

  def destroy
    find_task().destroy
    redirect_to tasks_path
  end
  
  
  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  
  def find_task
    @task = Task.find(params[:id])
  end
  
  
end
