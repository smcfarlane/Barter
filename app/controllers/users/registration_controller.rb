class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name, :heard_how
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