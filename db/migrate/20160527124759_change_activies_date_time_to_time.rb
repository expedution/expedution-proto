class ChangeActiviesDateTimeToTime < ActiveRecord::Migration
  def change
    change_column :activities, :starts_on, :time
    change_column :activities, :ends_on, :time
  end
end
