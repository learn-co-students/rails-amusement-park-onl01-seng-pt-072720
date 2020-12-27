class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
    session[:user_id]
  end 

  def logged_in?

  end 
end