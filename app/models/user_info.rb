class UserInfo < ActiveRecord::Base
  has_many :contact_infos
  belongs_to :user
end
