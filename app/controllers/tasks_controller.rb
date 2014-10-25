class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :edit, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      # flash[:notice] = "Task saved successfully!"
      # redirect_to question_path(@task)
      redirect_to @task, notice: "Task saved successfully!"
    else
      flash.now[:alert] = "Please correct errors below"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update task_params
      redirect_to @task, notice: "updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "Deleted successfully!"
  end



  private

  def find_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end

end
