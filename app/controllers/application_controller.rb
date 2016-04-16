class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # all controllers derive from app controller
  # this can be access by other controllers
  def authenticate_user!
    redirect_to new_session_path, notice: "Please sign in!" unless user_signed_in?
  end

  # helper methods are used in views
  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find session[:user_id]
  end
  helper_method :current_user

end
