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
end
