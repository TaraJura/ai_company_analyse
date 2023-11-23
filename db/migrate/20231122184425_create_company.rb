class CreateCompany < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :ico
      t.text :ares_data
      t.text :ai_analysed_data

      t.timestamps
    end
  end
end
