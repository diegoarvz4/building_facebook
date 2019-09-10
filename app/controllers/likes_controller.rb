# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    @like = Like.new(post_id: @post.id, user_id: current_user.id)
    if @like.save
      flash.notice = 'Liked!'
    else
      flash.alert = 'You cannot like it again'
    end
    redirect_to root_path
  end
end
