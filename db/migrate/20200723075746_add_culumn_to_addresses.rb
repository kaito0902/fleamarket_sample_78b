class AddCulumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :last_name, :string,  null: false
    add_column :addresses, :first_name, :string,  null: false
    add_column :addresses, :last_name_kana, :string,  null: false
    add_column :addresses, :first_name_kana, :string,  null: false
  end
end
