class ChangeColumnsTypeInExpeditions < ActiveRecord::Migration
  def change
    change_column :expeditions, :starts_on,  :date
    change_column :expeditions, :ends_on,  :date
  end
end
