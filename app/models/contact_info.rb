class ContactInfo < ActiveRecord::Base
  belongs_to :user_info
  has_one :service, foreign_key: :location
end
