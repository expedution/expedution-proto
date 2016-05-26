class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expeditions
  has_many :participations
  has_many :participant_expeditions, :class_name => "Expedition", :through => :participations, :source => :expedition
  has_many :feedbacks

  mount_uploader :photo, PhotoUploader
end
