class ApplicationController < ActionController::Base
  # helper_method :current_user
  # def current_user
  #   @current_user ||= User.first
  # end
  before_action :authenticate_user! # , except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
