class CreateExpeditions < ActiveRecord::Migration
  def change
    create_table :expeditions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :theme
      t.datetime :starts_on
      t.datetime :ends_time
      t.integer :capacity
      t.string :photo

      t.timestamps null: false
    end
  end
end
