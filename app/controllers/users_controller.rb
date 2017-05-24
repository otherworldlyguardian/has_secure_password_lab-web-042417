class UsersController < ApplicationController
  before_action :authenticate, only: :home
  
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/users/home'
    else
      redirect_to '/users/new'
    end
  end
end
