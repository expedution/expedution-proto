class Day < ActiveRecord::Base
  belongs_to :expedition
  has_many :activities

  def formatted_date
    date.strftime("%d/%m/%Y")
  end
end
