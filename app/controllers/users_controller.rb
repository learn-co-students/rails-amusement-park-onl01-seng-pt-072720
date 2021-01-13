class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params) 
    # raise params.inspect
    if !user.nil?
      session[:user_id] = user.id
      if user.admin
        session[:admin] = user.id
      end
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
    if session[:user_id]
      @user = User.find(session[:user_id]) 
    else
      redirect_to root_path
    end
    if params[:attraction_id].present?
      @attraction = Attraction.find(params[:attraction_id])
      if @user.height > @attraction.min_height && @user.tickets > @attraction.tickets
        @user.happiness += @attraction.happiness_rating
        @user.nausea += @attraction.nausea_rating
        @user.tickets -= @attraction.tickets
        @user.save
        flash[:alert] = "Thanks for riding the #{@attraction.name}!"
      elsif @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
        flash[:alert] = "You do not have enough tickets to ride the #{@attraction.name} & You are not tall enough to ride the #{@attraction.name}"
      elsif @user.tickets < @attraction.tickets
        flash[:alert] = "You do not have enough tickets to ride the #{@attraction.name}"
      elsif @user.height < @attraction.min_height
        flash[:alert] = "You are not tall enough to ride the #{@attraction.name}"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
