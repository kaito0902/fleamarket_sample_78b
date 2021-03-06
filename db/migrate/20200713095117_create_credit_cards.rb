class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true, null: false
      t.string :customer_id, null: false
      t.string :card_token, null: false
      t.timestamps
    end
  end
end
