class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.integer :value
      t.integer :price
      t.integer :guest

      t.timestamps
    end
  end
end
