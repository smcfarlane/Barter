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
  has_many :emails, through: :user_info
  has_many :boards
  has_many :message_threads, through: :subscribers, as: :discussable
  has_many :messages
  has_many :skills_users
  has_many :skills, through: :skills_users
  has_many :my_agreements, through: :boards, class_name: 'Agreement', source: :agreements
  has_many :agreements

  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :user_info
  accepts_nested_attributes_for :addresses, reject_if: proc { |attributes| attributes['zip'].blank? }
  accepts_nested_attributes_for :phones

end
