class Expedition < ActiveRecord::Base
  belongs_to :user
  has_many :days
  has_many :participations

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_on, presence: true, uniqueness: true
  validates :ends_on, presence: true
  # validates :capacity, presence: true
  # validates :theme, presence: true

  mount_uploader :photo, PhotoUploader
end
