class Agreement < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  def user1
    self.board.user
  end

  def user2
    self.user
  end
end