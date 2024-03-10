class CreateVerifications < ActiveRecord::Migration[7.1]
  def change
    create_table :verifications do |t|
      t.string :name

      t.timestamps
    end
  end
end
