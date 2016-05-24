class RenameColumnInExpedition < ActiveRecord::Migration
  def change
    rename_column :expeditions, :ends_time, :ends_on
  end
end
