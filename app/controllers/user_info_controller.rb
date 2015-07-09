class UserInfoController < ApplicationController
  def edit
  end

  def update
    current_user.user_info.update(get_user_info_params)
    if current_user.addresses[0]
      current_user.addresses[0].update(get_address_params)
    else
      a = Address.create(get_address_params)
      current_user.addresses << a
    end
    if current_user.phones[0]
      current_user.phones[0].update(get_phone_params)
    else
      p = Phone.create(get_phone_params)
      current_user.phones << p
    end
    if current_user.sign_in_count == 1 #TODO fix for admin registration
      cookies[:show_intro] = true
      redirect_to skills_path
    else
      redirect_to :root
    end
  end

  private

  def get_user_info_params
    params.require(:user_info).permit(:first_name, :last_name)
  end

  def get_address_params
    params.require(:address).permit(:street_address, :street_address2, :city, :state, :zip)
  end

  def get_phone_params
    params.require(:phone).permit(:phone)
  end
end
