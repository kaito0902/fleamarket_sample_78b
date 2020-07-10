class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,               null: false
      t.text :description,          null: false
      t.references :condition,      null: false, foreign_key: true
      t.references :category,       null: false, foreign_key: true
      t.references :brand,          foreign_key: true
      t.references :delivery_charge,null: false, foreign_key: true
      t.string :prefecture,         null: false
      t.string :day,                null: false
      t.integer :price,             null: false
      t.integer :saler_id,          foreign_key: true
      t.integer :buyer_id,          foreign_key: true
      t.timestamps
    end
  end
end
