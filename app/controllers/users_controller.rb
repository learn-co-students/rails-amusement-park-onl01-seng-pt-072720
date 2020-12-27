class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new 
        @user = User.new
    end 
    
    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id

        redirect_to user_path(@user) 
    end 

    def show 
    end 

    private 

    def set_user 
        @user = User.find(params[:id])
    end 

    def user_params 
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end 
end
