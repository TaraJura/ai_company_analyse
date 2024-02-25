class UpdateExtensionData < ActiveRecord::Migration[7.1]
  def change
    add_column :extension_data, :ip_address, :inet
    remove_column :clients, :ip_address, :inet
  end
end
