# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      @post = @comment.post
      redirect_to @post
      flash.notice = 'Comment added'
    else
      @posts = Post.all
      render 'posts/index'
      flash.now.alert = 'Invalid comment'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    flash.alert = @comment.destroy ? 'Comment deleted' : 'Comment could not be deleted'
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
