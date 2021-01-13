class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def home 
  end 

  def current_user 
    @user = User.find_by(id: session[:user_id])
  end 

  def logged_in?
    redirect_to '/' unless current_user
  end
end	