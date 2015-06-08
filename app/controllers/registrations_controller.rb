class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.user_info = UserInfo.new
    self.resource.addresses.build
    self.resource.phones.build
    respond_with self.resource
  end
end