class AddUniqueIndexToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_index :memberships, [:user_id, :contact_id], unique: true
  end
end
