class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit
  # What to do if Pundit fails
  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user
  after_action :verify_authorized, unless: :devise_controller?
  before_action :configure_sanitized_parameters, if: :devise_controller?

  

  private

  def configure_sanitized_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def pundishing_user
    flash[:alert] = "You are not allowed to go there. Begone dragon!"
    redirect_to(root_path)
  end
end
