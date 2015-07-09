class Phone < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :phone

  def self.save
    self.phone.gsub('-','').gsub('(','').gsub(')','')
    super
  end
end