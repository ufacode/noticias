class AddDeletedAtToNewsletters < ActiveRecord::Migration[5.0]
  def change
    add_column :newsletters, :deleted_at, :datetime
    add_index :newsletters, :deleted_at
  end
end
