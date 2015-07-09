class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :message_thread
  has_one :user_info, through: :user

  validates :text, :message_thread_id, presence: true
end
