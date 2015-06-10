class Agreement < ActiveRecord::Base
  belongs_to :provision1, foreign_key: :user1skill_id, class_name: 'SkillsUser'
  belongs_to :provision2, foreign_key: :user2skill_id, class_name: 'SkillsUser'

  has_one :user1, through: :provision1, class_name: 'User', source: 'user'
  has_one :user2, through: :provision2, class_name: 'User', source: 'user'

  has_one :skill1, through: :provision1, class_name: 'Skill', source: 'skill'
  has_one :skill2, through: :provision2, class_name: 'Skill', source: 'skill'
end