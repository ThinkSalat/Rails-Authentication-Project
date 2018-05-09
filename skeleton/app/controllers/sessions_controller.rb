class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
      
    if @user.nil?
      redirect_to new_session_url
    else
      session[:session_token] = @user.reset_session_token!
      redirect_to cats_url
    end
    
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end