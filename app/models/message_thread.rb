class MessageThread < ActiveRecord::Base
  has_many :messages
  has_many :subscribers
  belongs_to :discussable, polymorphic: true
end
