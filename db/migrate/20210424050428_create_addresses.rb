class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :buy, foreign_key: true
      t.string :postal_code, null: false
      t.integer :from_id, null: false
      t.string :cities, null: false
      t.string :address, null: false
      t.string :build_name
      t.integer :phone, null: false

      t.timestamps
    end
  end
end
