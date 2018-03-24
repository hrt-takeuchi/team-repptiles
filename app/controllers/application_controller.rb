class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # include SessionsHelper
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [ :name, :user_image, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.for(:sign_up)<< [:name, :user_image]
  end
end
