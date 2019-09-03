class PagesController < ApplicationController
  def home
    @posts = Post.all
  end
end
