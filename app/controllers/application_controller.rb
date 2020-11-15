class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :notice

  protect_from_forgery with: :exception

  def configure permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email]) 
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize 
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
