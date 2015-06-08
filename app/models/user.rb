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
  has_many :message_threads, through: :subscribers, as: :discussable
  has_many :messages
  accepts_nested_attributes_for :user_info
  accepts_nested_attributes_for :addresses, reject_if: proc { |attributes| attributes['zip'].blank? }
  accepts_nested_attributes_for :phones


  after_initialize :initialize_user_info
  after_initialize :initialize_address
  after_initialize :initialize_phone
  def initialize_user_info
    self.user_info = UserInfo.new() unless self.user_info
  end

  def initialize_address
    self.addresses.build unless self.addresses.present?
  end

  def initialize_phone
    self.phones.build unless self.phones.present?
  end
end
