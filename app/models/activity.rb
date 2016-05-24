class Activity < ActiveRecord::Base
  belongs_to :day
  has_many :ressources
  has_many :feedbacks
end
