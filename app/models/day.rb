class Day < ActiveRecord::Base
  belongs_to :expedition
  has_many :activities, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true

  def formatted_date
    date.strftime("%d/%m/%Y") if date
  end
end

