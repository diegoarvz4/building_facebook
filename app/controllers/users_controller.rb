# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: user_id_param)
    @profile = @user.profile
    @posts = @user.posts
  end

  def request_friend
    @friendship = current_user.friendships.build(friend_id: params[:id])
    if @friendship.save
      flash.notice = 'Friend request sent'
    else
      flash.alert = 'Failed to send request'
    end
    redirect_to users_path
  end

  def accept_friend
    friend = Friendship.find_by(id: params[:id])
    @friendship = friend.update_attributes(confirmed: true)
    if @friendship
      flash.notice = 'Friend accepted'
    else
      flash.alert = 'Failed to accept request'
    end
    redirect_to users_path
  end

  private

  def user_id_param
    params.require(:id)
  end
end
