class Phone < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :phone, format: { with: /^1*[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/}
end
