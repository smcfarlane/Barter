class Email < ActiveRecord::Base
  belongs_to :user_info
  belongs_to :user

  validates :email, format: /[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+/
end