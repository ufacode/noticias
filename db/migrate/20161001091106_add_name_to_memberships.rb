class AddNameToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :name, :string, limit: 255
  end
end
