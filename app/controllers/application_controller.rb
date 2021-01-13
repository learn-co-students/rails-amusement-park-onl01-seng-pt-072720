class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user 
    @user = User.find_by(id: session[:user_id])
  end 

  def require_login
    unless current_user
      redirect_to '/'
    end
  end 
end
