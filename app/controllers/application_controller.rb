class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :verified_user

  def current_user
    if session[:user_id].present?
      current_useruser = User.find_by(id: session[:user_id])
    end
  end
  
  def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

end
