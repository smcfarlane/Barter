class Skill < ActiveRecord::Base
  validates_presence_of :name

  has_many :users, through: :skills_users
  has_many :skills_users
end
