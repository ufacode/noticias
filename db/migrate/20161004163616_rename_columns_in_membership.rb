class RenameColumnsInMembership < ActiveRecord::Migration[5.0]
  def change
    rename_column :memberships, :user_id, :subscriber_id
    rename_column :memberships, :contact_id, :subscribed_id
  end
end
