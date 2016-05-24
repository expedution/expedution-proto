class Day < ActiveRecord::Base
  belongs_to :expedition
  has_many :activities
end
