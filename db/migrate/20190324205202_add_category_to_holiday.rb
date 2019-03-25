class AddCategoryToHoliday < ActiveRecord::Migration[5.2]
  def change
    add_reference :holidays, :category, foreign_key: true
  end
end
