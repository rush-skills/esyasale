class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def new_session_path(scope=nil)
    '/auth/google_oauth2'
  end
  def session_path(scope=nil)
    '/auth/google_oauth2'
  end
  protected

  def after_sign_out_path_for(resource)
  	'/'
  end
  def after_sign_in_path_for(resource)
    '/users/' + current_user.id.to_s
    # return the path based on resource
  end
end
