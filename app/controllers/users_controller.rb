class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params) 
    if !user.nil?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find([session[:user_id]])
  end

  def update
    @user = User.find([session[:user_id]])
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(session[:user_id])
    if params[:attraction_id].present?
      @attraction = Attraction.find(params[:attraction_id])
      if @user.height > @attraction.min_height && @user.tickets > @attraction.tickets
        @user.happiness += @attraction.happiness_rating
        @user.nausea += @attraction.nausea_rating
        @user.save
      end
      # raise params.inspect
      # redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
