class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # all controllers derive from app controller
  # this can be access by other controllers
  def authenticate_user!
    # puts "user_signed_in? in authenticate_user! >>>>>> #{user_signed_in?}"
    redirect_to new_session_path, notice: "Please sign in!" unless user_signed_in?
  end

  # helper methods are used in views
  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def is_authorized_for_current_user? authorized_user
    if current_user
      return current_user.id == authorized_user.id
    end
  end
  helper_method :is_authorized_for_current_user?


  # def current_user
  #   # use find_by_id so that it doesn't raise an exception if the user is not found
  #   # so we can still visit all products when the show page calls is_authorized_for_current_user?
  #   @current_user ||= User.find_by_id session[:user_id]
  # end
  # fix it another way
  def current_user
    @current_user ||= User.find session[:user_id] if user_signed_in?
  end
  helper_method :current_user

  def user_like
    @user_like ||= review.like_for(current_user)
  end
  helper_method :user_like

end
