class ChangeDatatypeAncestryOfCategories < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :ancestry, :string, index: true
  end
end
