class AddLimitNameToNewsletters < ActiveRecord::Migration[5.0]
  def up
    change_column :newsletters, :name, :string, limit: 255
  end

  def down
    change_column :newsletters, :name, :string
  end
end
