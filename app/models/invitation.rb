class Invitation < ActiveRecord::Base
  belongs_to :expedition
  validates :email, uniqueness: true
end
