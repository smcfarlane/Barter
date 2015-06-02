class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_user
  belongs_to :service
end
