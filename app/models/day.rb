class Day < ActiveRecord::Base
  belongs_to :expedition
  has_many :activities, dependent: :destroy

  def formatted_date
    date.strftime("%d/%m/%Y")
  end
end
