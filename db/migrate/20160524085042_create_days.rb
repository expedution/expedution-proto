class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :position
      t.datetime :date
      t.references :expedition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
