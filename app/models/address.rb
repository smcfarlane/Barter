class Address < ActiveRecord::Base
  belongs_to :user_info
  validates_presence_of :street_address, :city, :state, :zip
  # belongs_to :user, through: :user_info
end