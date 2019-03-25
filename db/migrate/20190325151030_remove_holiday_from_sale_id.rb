class RemoveHolidayFromSaleId < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :holiday_id
  end
end
