class CreateRessources < ActiveRecord::Migration
  def change
    create_table :ressources do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :photo
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
