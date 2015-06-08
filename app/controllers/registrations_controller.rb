class RegistrationsController < Devise::RegistrationsController
  def new
    super
    u = current_user
    u.user_info ||= UserInfo.new
    u.addresses << u.addresses.build unless u.addresses.count > 0
    u.emails << u.emails.build unless u.emails.count > 0
  end
end