class Activity < ActiveRecord::Base
  belongs_to :day
  has_many :resources
end
