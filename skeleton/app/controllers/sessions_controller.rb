class SessionsController < ApplicationController
  before_action :redirect, except: [:create,:destroy]
  
  def redirect
    redirect_to :root if current_user
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
      
    if @user.nil?
      redirect_to new_session_url
    else
      login_user!(@user)
      redirect_to cats_url
    end
    
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to :root
  end
end
