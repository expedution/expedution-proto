class RenameColumnAdressToAddressInActivity < ActiveRecord::Migration
  def change
    rename_column :activities, :adress, :address
  end
end
