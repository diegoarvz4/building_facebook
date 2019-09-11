# frozen_string_literal:true

module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def friendship(user)
    Friendship.find_by(user_id: user.id, friend_id: current_user.id)
  end
end
