class AddColumnThemeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :theme, :string
  end
end
