# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_friends

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
      redirect_to users_path
      flash.notice = 'Friend request sent'
    else
      redirect_to users_path
      flash.alert = 'Failed to send request'
    end
  end
 
  def accept_request
  end
  def pending_requests
  end
  private

  def user_id_param
    params.require(:id)
  end

end
