class AddOwnerIdToNewsletters < ActiveRecord::Migration[5.0]
  def change
    add_reference :newsletters, :user, foreign_key: true, index: true
  end
end
