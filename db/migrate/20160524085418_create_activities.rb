class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :category
      t.datetime :starts_on
      t.datetime :ends_on
      t.string :photo
      t.string :adress
      t.references :day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
