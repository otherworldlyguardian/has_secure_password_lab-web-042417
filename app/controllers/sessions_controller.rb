class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_name(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/users/home'
    else
     redirect_to "/sessions/new"
    end
  end
end
