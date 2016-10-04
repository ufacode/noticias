class DropUsersContactsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_contacts, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :contact, index: true
    end
  end
end
