class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]
  

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      if auth.info.email
        user.email = auth.info.email
      else
        user.email = "#{auth.info.nickname}@#{auth.provider}.oauth.net"
      end
      user.password = Devise.friendly_token[0,20]
      name = auth.info.name.split(' ')
      if name.length < 2
        ui = UserInfo.create(first_name: name[0], last_name: '')
      end
      ui = UserInfo.create(first_name: name[0], last_name: name[1]) unless name.length < 2
      user.user_info = ui  # assuming the user model has a name
    end
  end

  def self.search(search)
    if search
      if search == ""
        all.order('email ASC')
      else
        where("lower(email) LIKE ?", "%#{search.downcase}%").order('email ASC')
      end
    else
      all
    end
  end
end
