class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

def create
   @comment = Comment.new(comment_params)
 if @comment.save
    @post = @comment.post
     redirect_to request.referrer 
    flash.notice = "Comment added"
   else
    redirect_to root_path
   flash.alert = "Invalid comment"
  end
end



private

def comment_params
 params.require(:comment).permit(:content, :author_id, :post_id)
end


end
