class DiscussionsController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @discussions = @project.discussions
    @discussion = Discussion.new
  end

  def create
    @project = Project.find params[:project_id]
    @discussion = Discussion.new discussion_params
    @discussion.project = @project

    if @discussion.save
      redirect_to project_discussions_path(@project), notice: "Discussion created"
    else
      render "discussions/index"
    end
  end

  def edit
  end


  def destroy
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
    if @discussion.destroy
      redirect_to project_discussions_path(@project), notice: "Discussion deleted"
    else
      redirect_to project_discussions_path(@project), alert: "Discussion wasn't deleted"
    end
  end

  def show
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
    @comment = Comment.new
  end


  private


  def discussion_params
    params.require(:discussion).permit(:title, :description)
  end


end