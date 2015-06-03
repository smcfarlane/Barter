class UserInfo < ActiveRecord::Base
  has_many :addresses
  belongs_to :user
  accepts_nested_attributes_for :address
end
