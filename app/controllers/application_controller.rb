class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age,:sex,:email,:favorite])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name,:age,:sex,:email,:favorite,:user_image])
  end
end
