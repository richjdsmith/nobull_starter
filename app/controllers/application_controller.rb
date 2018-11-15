class ApplicationController < ActionController::Base
  before_action :configure_sanitized_parameters, if: :devise_controller?

  private

  def configure_sanitized_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
