class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:user][:name])
    if user.authenticate(params[:password]) 
      session[:user_id] = user.id
      if user.admin
        session[:admin] = user.id
      end
      # raise params.inspect
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
