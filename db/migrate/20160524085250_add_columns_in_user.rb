class AddColumnsInUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :bio, :text
    add_column :users, :job, :string
    add_column :users, :company, :string
    add_column :users, :phone, :string
    add_column :users, :diet, :string
    add_column :users, :organiser, :boolean, :default => false
  end
end
