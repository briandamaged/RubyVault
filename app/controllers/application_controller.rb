class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    # Hmm.  It looks like this user has been deleted.  Let's just
    # pretend that the user was never logged in.
  end
  
  def logged_in?
    current_user != nil
  end

end
