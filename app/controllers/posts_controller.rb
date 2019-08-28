class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create

    post = current_user.posts.new(post_params)

    if post.save 
      redirect_to root_path
    end 

  end

  def destroy
  end

  def edit
  end

  def update
  end

  private 

    def post_params
      params.require(:post).permit(:content, :author_id)
    end 

end
