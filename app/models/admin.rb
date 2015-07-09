class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :timeoutable, :registerable, :rememberable
  has_one :user_info
  has_many :addresses
  has_many :phones
  has_many :emails, through: :user_info

  accepts_nested_attributes_for :user_info
  accepts_nested_attributes_for :addresses, reject_if: proc { |attributes| attributes['zip'].blank? }
  accepts_nested_attributes_for :phones
end
