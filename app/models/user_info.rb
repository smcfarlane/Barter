class UserInfo < ActiveRecord::Base
  has_many :addresses
  belongs_to :user
end
