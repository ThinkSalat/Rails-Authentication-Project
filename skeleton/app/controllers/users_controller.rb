class UsersController < ApplicationController
  before_action :redirect, except: [:create,:destroy, :show]
  
  def redirect
    redirect_to :root if current_user
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      redirect_to new_user_url
    end
  end
  
  def show
    render :show
  end
  
  private
  def user_params
    params.require(:user).permit(:user_name,:password)
  end
  
end
