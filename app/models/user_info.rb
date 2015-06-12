class UserInfo < ActiveRecord::Base
  has_many :addresses
  has_many :emails
  belongs_to :user
  belongs_to :messages
  validates_presence_of :first_name, :last_name
  # accepts_nested_attributes_for :addresses
end
