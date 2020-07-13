class AppChangeProduct < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :user
    change_column_null :products, :brand_id, :reference, true
  end
end