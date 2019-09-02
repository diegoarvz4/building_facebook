class PostsController < ApplicationController


  def index
    @posts = Post.all
  end

  def new
  end

  def create

    post = current_user.posts.new(post_params)

    if post.save 
      flash.notice = "Posted!"
    else  
      flash.alert = "Post should not be empty!"
    end 
    redirect_to root_path
    
    

  end



  def edit
    @post = Post.find_by(params[:id])
  end

  def update
    @post = Post.find_by(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
        redirect_to request.referrer
    else 
        render 'edit'
    end 
    
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.destroy
    flash.alert = "Post successfully deleted!"
    redirect_to request.referrer 
  end

  private 

    def post_params
      params.require(:post).permit(:content, :author_id)
    end 


end


