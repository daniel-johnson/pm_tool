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
      redirect_to @project, notice: "Discussion created"
    else
      render "discussions/index"
    end
  end

  def edit
  end


  def destroy
    @discussion = Discussion.find params[:id]
    @project = Project.find @discussion.project_id
    if @discussion.destroy
      redirect_to @project, notice: "Discussion deleted"
    else
      redirect_to @discussion, alert: "Discussion wasn't deleted"
    end
  end

  def show
    @discussion = Discussion.find params[:id]
    @project = Project.find @discussion.project_id
    @comment = Comment.new
    @comments = @discussion.comments.all
  end


  private


  def discussion_params
    params.require(:discussion).permit(:title, :description)
  end


end