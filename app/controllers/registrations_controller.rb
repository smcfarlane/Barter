class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.user_info = UserInfo.new
    self.resource.addresses.build
    self.resource.phones.build
    respond_with self.resource
  end

  def after_sign_up_path_for(resource)

    if resource.sign_in_count == 1 #TODO fix for admin registration
      resource.valid? ? skills_path : root_path
    else

     case resource && current_user
       when :user, User
<<<<<<< HEAD
         # resource.valid? ? profile_index_path(current_user) : root_path
         cookies[:show_intro] = true;
         resource.valid? ? authenticated_root_path(current_user) : root_path
=======
         resource.valid? ? profile_path(current_user) : root_path
>>>>>>> development
       when :admin, Admin
         resource.valid? ? admin_dash_path(current_user) : root_path
       else
         super
     end
    end
  end
end