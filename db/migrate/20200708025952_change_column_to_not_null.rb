class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column :categories, :ancestry, :string, null: true
  end

  def down
    change_column :categories, :ancestry, :string, null: false
  end
end
