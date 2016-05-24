class AddLocationInExpedition < ActiveRecord::Migration
  def change
    add_column :expeditions, :location, :string
  end
end
