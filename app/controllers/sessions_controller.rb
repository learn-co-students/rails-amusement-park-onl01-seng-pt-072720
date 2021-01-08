require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: user_params[:name]) # regular `params` aren't automatically permitted, hence calling on the private `user_params` method
      if @user && @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          redirect_to root_path
      end
    end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def home

  end

  private 

  def user_params
      params.require(:user).permit(:name, :password)
  end
end
