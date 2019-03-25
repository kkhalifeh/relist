class AddDateToHoliday < ActiveRecord::Migration[5.2]
  def change
    add_column :holidays, :check_in, :date
    add_column :holidays, :check_out, :date
  end
end
