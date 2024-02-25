class CreateEvidenceOfUserData < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :token_identifier
      t.inet :ip_address

      t.timestamps
    end

    create_table :extension_data do |t|
      t.json :data
      t.string :url_send_from

      t.references :client, null: false, foreign_key: true
      t.timestamps
    end
  end
end
