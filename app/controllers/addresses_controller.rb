class AddressesController < ApplicationController
  def get_user_address
    @address = current_user.addresses[0]
    render json: @address
  end

  def get_addresses_near_user
    @address = current_user.addresses[0]
    @address = Address.near("#{@address.city}, #{@address.state}, US", 30)
    users = []
    @address.each {|a| users << a.user_id}
    @users = User.joins(:boards, :addresses).where(id: users).select(:skill_needed, :skills_offered, 'addresses.latitude', 'addresses.longitude')
    render json: @users
  end
end