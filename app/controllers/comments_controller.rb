class CommentsController < ApplicationController
before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.new comment_params
    @comment.discussion = @discussion

    if @comment.save
      redirect_to @discussion, notice: "Comment created"
    else
      render "discussions/show"
    end
  end

  def edit
  end

  def update
    @discussion = @comment.discussion params[:discussion_id]
    if @comment.update comment_params
      redirect_to @discussion
    else
      render :edit
    end
  end

  def destroy
    @discussion = @comment.discussion params[:discussion_id]
    if @comment.destroy
      redirect_to @discussion, notice: "Comment Deleted"
    else
      redirect_to @discussion, alert: "Comment not deleted"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

end
