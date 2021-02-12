require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def home

  end

  private 

  # def user_params
  #     params.require(:user).permit(:name, :password)
  # end
end
