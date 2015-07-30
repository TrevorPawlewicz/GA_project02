class UsersController < ApplicationController

    def new
        # instantiate a new User object and then render sign-up form:
        @user = User.new
    end

    def create
        # instantiates new user with the parameters:
        @user = User.new(user_params)

        if (@user.save)
            # if the user can be saved, go to the root.
            redirect_to root_url, notice: "Welcome to the site!"
        else
            # else, go to the new page
            render "new"
        end
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order("created_at DESC")
    end

    #250-----------------------
    before_action :authenticate_user!, only: :follow

    # 156
    def follow
        @user = User.find(params[:id])

        if current_user.follow!(@user)
            redirect_to @user, notice: "Follow successful!"
        else
            redirect_to @user, alert: "Error following..."
        end
    end


    #---------------------------------------------------------------------------
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
