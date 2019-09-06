class UsersController < ApplicationController
    
    def index
        @users = User.all
    end 
    
    def show
       @user =  User.find_by(id: user_id_param)
       @profile = @user.profile
       @posts = @user.posts 
    end 

    private

        def user_id_param
            params.require(:id)
        end 
end
