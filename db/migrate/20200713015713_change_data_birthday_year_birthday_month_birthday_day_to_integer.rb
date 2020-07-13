class ChangeDataBirthdayYearBirthdayMonthBirthdayDayToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :birthday_year, :integer,  null: false
    change_column :users, :birthday_month, :integer,  null: false
    change_column :users, :birthday_day, :integer,  null: false
  end
end
