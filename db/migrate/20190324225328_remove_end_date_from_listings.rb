class RemoveEndDateFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :end_date
  end
end
