class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

def create
   @comment = Comment.new(comment_params)
 if @comment.save
    @post = @comment.post
     redirect_to @post 
    flash.notice = "Comment added"
   else
    redirect_to root_path
   flash.alert = "Invalid comment"
  end
end

def destroy
  @comment = Comment.find_by(id: params[:id])
  if @comment.destroy
    flash.alert = "Comment deleted"
    redirect_to request.referrer 
  else
    flash.alert = "comment could not be deleted"
    redirect_to request.referrer 
  end
end

private

def comment_params
 params.require(:comment).permit(:content, :author_id, :post_id)
end


end
