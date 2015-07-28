class UsersController < ApplicationController

    def new
        # instantiate a new User object and then render sign-up form:
        @user = User.new
    end


    def created
        # instantiates new user with the parameters:
        @user = User.new(user_params)

        if (user.save)
            # if the user can be saved, go to the root.
            redirect_to root_url, notice: "Welcome to the site!"
        else
            # else, go to the new page
            render "new"
        end

        private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    end
end
