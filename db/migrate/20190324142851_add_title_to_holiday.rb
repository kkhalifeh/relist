class AddTitleToHoliday < ActiveRecord::Migration[5.2]
  def change
    add_column :holidays, :title, :string
  end
end
