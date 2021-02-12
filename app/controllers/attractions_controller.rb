class AttractionsController < ApplicationController
  before_action :verify_admin, except: [:index, :show]
  before_action :current_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def destroy
    @attraction.destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def verify_admin
    if !User.find(session[:user_id]).admin
      redirect_to attractions_path
    end
  end

  def current_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
