class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name,     null: false
      t.integer :category_id, null: false
      t.integer :status_id,   null: false
      t.text    :description, null: false
      t.integer :postage_id,  null: false
      t.integer :from_id,     null: false
      t.integer :send_about_id, null: false
      t.integer :price,         null: false

      t.timestamps
    end
  end
end
