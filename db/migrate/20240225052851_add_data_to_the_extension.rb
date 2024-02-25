class AddDataToTheExtension < ActiveRecord::Migration[7.1]
  def change
    add_column :extension_data, :battery_level, :string
    add_column :extension_data, :is_charging, :boolean
    add_column :extension_data, :user_agent , :string
  end
end
