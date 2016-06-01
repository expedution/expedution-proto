class Activity < ActiveRecord::Base
  belongs_to :day
  has_many :ressources, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  ACTIVITY_CATEGORY = ["Flight", "Hotel", "Transportation", "Restaurant", "Meeting"]

  validates :title, presence: true
  validates :category, presence: true, inclusion: {in: ACTIVITY_CATEGORY, allow_nil: false}
  validates :day_id, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_votable

end
