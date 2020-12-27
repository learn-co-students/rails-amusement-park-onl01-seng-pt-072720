class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home 
  end 

  def current_user 
    session[:user_id]
  end 

  def logged_in?
    redirect_to '/' unless current_user
  end 
end