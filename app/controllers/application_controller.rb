class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user
  helper_method :current_user

  private

  def verify_user
    redirect_to '/' unless !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
