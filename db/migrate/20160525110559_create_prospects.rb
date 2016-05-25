class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :email
      t.datetime :starts_on
      t.integer :capacity
      t.string :location

      t.timestamps null: false
    end
  end
end
