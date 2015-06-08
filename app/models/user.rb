class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_info
  has_many :services, through: :service_users
  has_many :service_users
  has_many :proposals
  has_many :addresses
  has_many :phones
  accepts_nested_attributes_for :user_info
  accepts_nested_attributes_for :addresses, reject_if: proc { |attributes| attributes['zip'].blank? }
  accepts_nested_attributes_for :phones

end
