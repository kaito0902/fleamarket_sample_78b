class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user,           null: false, foreign_key: true
      t.integer :post_code,         null: false
      t.string :prefecture,         null: false
      t.string :city,               null: false
      t.integer :house_number,      null: false
      t.string :building_name,      null: false
      t.timestamps
    end
  end
end
