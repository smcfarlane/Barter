class Service < ActiveRecord::Base
  belongs_to :contact_info, foreign_key: :location
  belongs_to :user
  belongs_to :category
end
