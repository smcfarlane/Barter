class Address < ActiveRecord::Base
  belongs_to :user_info
  def full_street_address
    "#{self.street_address} #{self.city}, #{self.state} #{self.zip}"
  end

  validates_presence_of :street_address, :city, :state, :zip
  validates :zip, format: {with: /[0-9]{5}/, message: "must be 5 numbers ex: 56567"}

  # belongs_to :user, through: :user_info
  geocoded_by :full_street_address
  after_validation :geocode, if: ->(obj){ obj.street_address.present? and obj.street_address_changed? }
end
