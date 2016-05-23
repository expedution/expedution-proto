class Expedition < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  # validates :capacity, presence: true
  # validates :theme, presence: true
end
