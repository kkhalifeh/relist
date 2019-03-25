class AddDescriptionToHoliday < ActiveRecord::Migration[5.2]
  def change
    add_column :holidays, :description, :string
  end
end
