class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :expedition
  validates :user, uniqueness: { scope: :expedition }
end
