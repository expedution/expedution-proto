class AddCategoryToRessources < ActiveRecord::Migration
  def change
    add_column :ressources, :category, :string
  end
end
