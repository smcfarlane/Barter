class MessageThread < ActiveRecord::Base
  has_many :messages
  has_many :subscribers
  belongs_to :discussable, polymorphic: true

  validates :title, presence: true
end
