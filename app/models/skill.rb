class Skill < ActiveRecord::Base
  validates_presence_of :name

  # has_and_belongs_to_many :users
  has_many :users, through: :skills_users
  has_many :skills_users
  # belongs_to :user
end
