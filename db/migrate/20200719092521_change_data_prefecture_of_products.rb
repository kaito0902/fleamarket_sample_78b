class ChangeDataPrefectureOfProducts < ActiveRecord::Migration[6.0]
  def up
    change_column :products, :prefecture, :integer,   null: false
  end

  def down
    change_column :products, :prefecture, :string,   null: false
  end
end