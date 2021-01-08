class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        redirect_to '/'
    end
  end

  def show
    if !session[:user_id]
      redirect_to root_path
    end
    @user = User.find(params[:id])
  end

  private

  def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
  end

  # private

  # def user_params
  #     params.require(:user).permit(:name, :password)
  # end
end
