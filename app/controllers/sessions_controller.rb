class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:eamil])
    if user && user.authenticate(params[:pasword])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
  end

  def destroy
    session[:user:id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
