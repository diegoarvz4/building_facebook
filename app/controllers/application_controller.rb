class ApplicationController < ActionController::Base
    
   include DeviseHelper
   before_action :authenticate_user!

   before_action :configure_permitted_parameters, if: :devise_controller?
   
   def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
   end

   protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :email, 
         :password, 
         :current_password,
         profile_attributes: [:id, :name, :city, :country, :description])}
   end

end
