class RemoveHolidayFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :holiday_id
  end
end
