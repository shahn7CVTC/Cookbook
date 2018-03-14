class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_title
  
  helper_method :current_user
  
  private
  
  def authenticate
    if user = authenticate_with_http_basic {|user, password| User.authenticate(user, password)}
      session[:user_id] = user.id
      session[:logged_in] = true
    else
      request_http_basic_authentication
    end
  end
  
  def set_title
    @title = "Cookbook"
  end
  
  helper_method :logged_in?
  
  def logged_in?
    session[:logged_in]
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  
end
