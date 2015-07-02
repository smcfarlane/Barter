class Board < ActiveRecord::Base
  belongs_to :user
  has_one :message_thread, as: :discussable
  has_many :agreements

  validates :user_id, :skill_needed, :skills_offered, :details, :status, :needed_by, presence: true
  # validate :validate_skill_needed
  # validate :validate_skills_offered
  validate :validates_needed_by

  def validate_skill_needed
    if !skill_needed.is_a? Array || skill_needed.count != 1
      errors.add(:skill_needed, :invalid)
    elsif !Skill.pluck(:name).include?(skill_needed[0])
      errors.add(:skill_needed, :invalid)
    end
  end

  def validate_skills_offered
    if !skills_offered.is_a? Array || skills_offered.count > 0
      errors.add(:skills_offered, :invalid)
    else
      skills = Skill.pluck(:name)
      skills_offered.each do |skill|
        errors.add(:skills_offered, :invalid) unless skills.include? skill
      end
    end
  end

  def validates_needed_by
    errors.add(:needed_by, :invalid) if needed_by.past?
  end

  def self.search(search)
    if search
      if search == ""
        all
      else
        where("lower(details->>'email') LIKE ? OR lower(details->>'city') LIKE ? OR array_to_string(skill_needed, ', ') LIKE ? OR array_to_string(skills_offered, ', ') LIKE ? OR lower(status) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
      end
    else
      all
    end
  end
end
