class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    @current_user
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out
    session[:session_token] = nil
  end

  private

  def ensure_signed_in
    unless current_user
      redirect_to new_session_url
    end
  end

end
