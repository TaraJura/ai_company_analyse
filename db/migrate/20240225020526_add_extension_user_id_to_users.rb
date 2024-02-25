class AddExtensionUserIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :extension_user_id, :integer
  end
end
