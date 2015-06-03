class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # my custom fields are :name, :heard_how
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password, user_info_attributes: [:first_name, :last_name],
          address_attributes: [:street_address, :street_address2, :city, :state, :zip], email_attributes: [:email], phone_attributes: [:phone])
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password, user_info_attributes: [:first_name, :last_name],
          address_attributes: [:street_address, :street_address2, :city, :state, :zip], email_attributes: [:email], phone_attributes: [:phone])
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password, user_info_attributes: [:first_name, :last_name],
          address_attributes: [:street_address, :street_address2, :city, :state, :zip], email_attributes: [:email], phone_attributes: [:phone])
    end
  end

end
