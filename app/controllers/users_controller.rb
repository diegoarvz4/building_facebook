class UsersController < ApplicationController
    def index
    end 
    def new
     @user = User.new
    end

    def create
    end

    def show
  
       @profile = current_user.profile
       
    end 

    def update

        profile = current_user.profile
        profile.assign_attributes(user_profile_params)
        if profile.save
            redirect_to profile_path
        else 
            render 'edit'
        end 
    end 

    private

    def user_params
     params.require(:user).permit(:email,:password)
    end

    def user_profile_params
        params.require(:user).permit(:name, :city, :country, :description, :birthdate)
    end 
end
