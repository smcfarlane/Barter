class Skill < ActiveRecord::Base
  validates_presence_of :name

  has_many :users, through: :skills_users
  has_many :skills_users

  def self.search(search)
    if search
      if search == ""
        all.order('name ASC')
      else
        where("lower(name) LIKE ?", "%#{search.downcase}%").order('name ASC')
      end
    else
      all
    end
  end
end
