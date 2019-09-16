# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    unless accepted_users.nil?
      @posts = accepted_users.map(&:posts).flatten!
    unless @posts.nil? && current_user.posts.nil?
      @posts += current_user.posts
      @posts.sort_by! { |key| key['created_at'] }.reverse!
      end
    end
    @post = Post.new
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

  def show; end

  def edit; end

  def update
    if @post.update_attributes(content: params[:post][:content])
      flash.notice = 'Post update successfull!'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      flash.notice = 'Post successfully deleted!'
    else
      flash.alert = 'An error has occured'
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :id)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
