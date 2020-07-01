class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.string :status,   null: false
      t.timestamps
    end
  end
end
