class Ressource < ActiveRecord::Base
  belongs_to :activity

  mount_uploader :photo, PhotoUploader
end
