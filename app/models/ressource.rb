class Ressource < ActiveRecord::Base
  belongs_to :activity

  mount_uploader :photo, PhotoUploader

  RESSOURCES_CATEGORY = ["File", "URL", "Other"]

end
