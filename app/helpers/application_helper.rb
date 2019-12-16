# frozen_string_literal:true

module ApplicationHelper
  include Friends
  def user_name(user)
    user.email.split('@')[0].capitalize
  end
end
