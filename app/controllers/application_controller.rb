class ApplicationController < ActionController::Base
    include DeviseHelper
    before_action :authenticate_user!, :except => [:new]
    
   def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
   end
end
