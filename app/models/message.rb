class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :message_thread
  has_one :user_info, through: :user
end
