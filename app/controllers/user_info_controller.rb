class UserInfoController < ApplicationController
  include ActiveModel::Validations
  validates_presence_of :last_name

  def edit
  end

  def update
    #if current_user.user_info.last_name == " "
    #else
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
        if current_user.user_info.last_name == ""
          flash[:danger] = "Last name can't be blank"
          redirect_to user_info_edit_path
        else
          current_user.user_info.update_attributes(get_user_info_params)
          cookies[:show_intro] = true
          redirect_to skills_path 
        end
      else
        redirect_to :root
      end
    #end
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
