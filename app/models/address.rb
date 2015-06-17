class Address < ActiveRecord::Base
  belongs_to :user_info
  def full_street_address
    "#{self.street_address} #{self.city}, #{self.state} #{self.zip}"
  end
  # geocoded_by :full_street_address
  validates_presence_of :street_address, :city, :state, :zip
  # belongs_to :user, through: :user_info

  # after_validation :geocode
end