class Activity < ActiveRecord::Base
  belongs_to :day
  has_many :ressources
  has_many :feedbacks

  mount_uploader :photo, PhotoUploader

  ACTIVITY_CATEGORY = ["Flight", "Hotel", "Transportation", "Restaurant", "Meeting"]

end
