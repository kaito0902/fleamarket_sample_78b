class AddColumnSalerIdBuyerId < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :saler_id, :integer,  foreign_key: true
    add_column :products, :buyer_id, :integer,  foreign_key: true
  end
end
