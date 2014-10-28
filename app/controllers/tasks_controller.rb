class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :edit, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @project = Project.find params[:project_id]
    @task = Task.new task_params
    @task.project = @project
    if @task.save
      # flash[:notice] = "Task saved successfully!"
      # redirect_to question_path(@task)
      redirect_to @project, notice: "Task saved successfully!"
    else
      flash.now[:alert] = "Please correct errors below"
      render 'projects/show'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update task_params
      redirect_to @task.project
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
    params.require(:task).permit(:title, :due_date, :done)
  end

end
