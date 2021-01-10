class AttractionsController < ApplicationController
    before_action :find_attr, only: [:show, :edit]

    def index
        @attractions = Attraction.all
    end

    def show
        # @attraction = Attraction.find_by(id: params[:id])
        ride
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def edit
        # @attraction = Attraction.find_by(id: params[:id])
        ride
    end

    def update
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end

    private

    def find_attr
        @attraction = Attraction.find_by(id: params[:id])
    end

    def ride
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end
end
