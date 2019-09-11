# frozen_string_literal:true

module UsersHelper
  def current_user?(user)
    user == current_user
  end
end
