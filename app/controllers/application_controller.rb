class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def new_session_path(scope=nil)
    '/users/auth/google_oauth2'
  end
  def session_path(scope=nil)
    '/users/auth/google_oauth2'
  end

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def after_sign_out_path_for(resource)
  	'/'
  end
  def after_sign_in_path_for(resource)
    '/dashboard'
    # return the path based on resource
  end
end
