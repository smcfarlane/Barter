class Agreement < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  validates :user1skill, :user2skill, :due_date, :board_id, :user_id, presence: true
  validate :validates_user1skill
  validate :validates_user2skill
  validate :validates_due_date

  def validates_user1skill
    errors.add(:user1skill, :invalid) unless Skill.pluck(:name).include? user1skill
  end

  def validates_user2skill
    errors.add(:user2skill, :invalid) unless Skill.pluck(:name).include? user2skill
  end

  def validates_due_date
    errors.add(:due_date, :invalid) if due_date.past?
  end

  def user1
    self.board.user
  end

  def user2
    self.user
  end

end