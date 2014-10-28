class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :edit, :destroy]

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new project_params
    if @project.save
      # flash[:notice] = "Question saved successfully!"
      # redirect_to question_path(@question)
      redirect_to @project, notice: "Project saved successfully!"
    else
      flash.now[:alert] = "Please correct errors below"
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @task = Task.new
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to @project, notice: "updated successfully!"
    else
      render :edit
    end
  end

  def destroy
  @project.destroy
  redirect_to root_path, notice: "Deleted successfully!"
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

end