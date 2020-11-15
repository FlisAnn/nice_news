class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :notice

  protect_from_forgery with: :exception

def configure permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  devise_parameter_sanitizer.permit(:account_update, keys: [:email]) 
end

end
