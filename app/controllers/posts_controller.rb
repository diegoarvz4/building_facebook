class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end
  
  def new
    @comment = Comment.new
  end

  def create

    @post = current_user.posts.new(post_params)

    if @post.save 
      flash.notice = 'Posted!'
      redirect_to root_path
    else  
      flash.alert = 'Post should not be empty!'
      @posts = Post.all
      render 'posts/index'
    end 
    
  end

  def show 
  
  end 


  def edit
  
  end

  def update

    if @post.update_attributes(content: params[:post][:content])
        flash.notice = 'Post update successfull!'
        redirect_to root_path
    else 
        render 'edit'
    end 
    
  end

  def destroy
    
    @post.destroy
    flash.alert = 'Post successfully deleted!'
    redirect_to request.referrer
  end

  private 

    def post_params
      params.require(:post).permit(:content, :author_id)
    end 

    def set_post
      @post = Post.find_by(id: params[:id])
    end 


end


