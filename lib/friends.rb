# frozen_string_literal:true

module Friends
  def friendship(user)
    Friendship.find_by(user_id: user.id, friend_id: current_user.id)
  end

  def friendships_users
    current_user.friendships.map(&:friend)
  end

  def expected_friends
    current_user.inverse_friendships.reject(&:confirmed).map(&:user)
  end

  def pending_users
    current_user.friendships.reject(&:confirmed).map(&:friend)
  end

  def accepted_users
    accepted = current_user.friendships.select(&:confirmed).map(&:friend)
    accepted + current_user.inverse_friendships.select(&:confirmed).map(&:user)
  end
end
