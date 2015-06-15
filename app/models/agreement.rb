class Agreement < ActiveRecord::Base
  belongs_to :user, foreign_key: :user1
  belongs_to :user, foreign_key: :user2
  belongs_to :board
end