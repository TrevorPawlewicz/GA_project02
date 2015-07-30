class PostsController < ApplicationController
    # a method that runs automatically before any other action in the controller:
    before_action :authenticate_user!
    #--------------------------------
    def new
    end
    
    def index
        # retreives all posts from the database and assigns them to the @posts variable:
        # @posts = Post.all

        user_ids = current_user.timeline_user_ids
        @posts = Post.includes(:user).where(user_id: user_ids).order("Created_at DESC")
    end

    def show
        # finds the requested post using the id from the params hash
        # renders the view at posts/show.html.erb
        @post = Post.find(params[:id])
        @can_modify = (current_user == @post.user) # return true if current user
    end
end
