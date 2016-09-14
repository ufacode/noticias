class AddLimitNameToUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :name, :string, limit: 255
  end

  def down
    change_column :users, :name, :string
  end
end
