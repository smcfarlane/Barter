class Service < ActiveRecord::Base
  belongs_to :contact_info, foreign_key: :location
  belongs_to :user
  belongs_to :category
  has_many :users, through: :service_users
  has_many :service_users
  has_many :proposals
end
