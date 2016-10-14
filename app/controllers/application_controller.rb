class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def configure_permitted_parameters
  #singupのときにnameを登録できるように
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end

end
