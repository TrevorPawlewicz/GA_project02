class SessionsController < ApplicationController

    def new
        # renders the login form.
        # The controller action dosn't need to do anything.
    end


    def created
        # look for a user record by email address:
        user = User.find_by(email: params[:email])

        # if a matching user can be verified by password, store the user id:
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_url, notice: "Log in Successful!"
        else
            # something is wrong with user:
            flash.now.alert = "Invalid email or password!"
            render "new"
        end
    end


    def destroy
        session[:user_id] = nil # clear user id
        redirect_to root_url, notice: "Logout successful!" # direct to "new" page
    end

end
