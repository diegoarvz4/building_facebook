class UsersController < ApplicationController
    def index
        @users = User.all
    end 
    
    def new
        @user = User.new
    end

    def show
       
       @user =  User.find_by(id: user_id_param)
       @profile = @user.profile
       @posts = @user.posts 

    end 

    def update

        profile = current_user.profile
        profile.assign_attributes(user_profile_params)
        if profile.save
            redirect_to current_user
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

    def user_id_param
        params.require(:id)
      
    end 
end
