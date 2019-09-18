# frozen_string_literal:true

class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, uniqueness: { scope: :friend_id }
  validate :friends?

  def friends?
    if Friendship.where(user_id: user_id, friend_id: friend_id, confirmed: true).exists? ||
       Friendship.where(user_id: friend_id, friend_id: user_id, confirmed: true).exists?
      errors.add(:friendship, 'Friends already!')
    elsif Friendship.where(user_id: friend_id, friend_id: user_id, confirmed: false).exists?
      errors.add(:friendship, 'You have a pending request from this user!')
    end
  end
end
