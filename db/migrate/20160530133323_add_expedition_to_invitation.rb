class AddExpeditionToInvitation < ActiveRecord::Migration
  def change
    add_reference :invitations, :expedition, index: true, foreign_key: true
  end
end
