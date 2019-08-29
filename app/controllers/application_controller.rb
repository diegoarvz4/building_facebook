class ApplicationController < ActionController::Base
    include DeviseHelper
    before_action :authenticate_user!

end
