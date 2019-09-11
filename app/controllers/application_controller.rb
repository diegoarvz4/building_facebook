# frozen_string_literal:true

class ApplicationController < ActionController::Base
  include DeviseHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email,
               :password,
               :current_password,
               profile_attributes: %i[id name city country description])
    end
  end

  def find_friends
    @friendships = current_user.friendships
    @friendships_users = @friendships.map(&:friend)

    @pending = @friendships.select(&:confirmed)
    @pending_users = @pending.map(&:friend)

    @accepted = @friendships.select(&:confirmed)
    @accepted_users = @accepted.map(&:friend)

    @expected = current_user.inverse_friendships.reject(&:confirmed)
    @expected_users = @expected.map(&:friend)
  end
end
