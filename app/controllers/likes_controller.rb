class LikesController < ApplicationController

    def create 

        @post = Post.find_by(id: params[:post_id])

        @like = Like.new(post_id: @post.id, user_id: current_user.id)

        if @like.save
            flash.notice = "Liked!"
            redirect_to post_path(@post)
        else  
            flash.alert = "You can't like it again"
            render 'posts/show'
        end 

    end 

end