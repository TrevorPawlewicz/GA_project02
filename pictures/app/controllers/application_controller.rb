class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #-----------------------------------------------------------------------------
  private

  def current_user
      if session[:user_id]
          @current_user ||= User.find(session[:user_id])
      end
  end

  # this method will be available to ALL controllers and views (so other parts
  # of the app can access the current user).
  helper_method :current_user   # will return nil when no one is logged in.

  # a before_action method used in PostsController:
  def authenticate_user!
    # redirect to the login page if  there is NO current user:
    redirect_to login_path unless current_user
  end

  #-----------------------------------------------------------------------------
end
