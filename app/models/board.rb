class Board < ActiveRecord::Base
  belongs_to :user
  has_one :message_thread, as: :discussable
  has_many :agreements
end
