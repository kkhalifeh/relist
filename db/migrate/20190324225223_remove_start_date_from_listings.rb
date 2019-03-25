class RemoveStartDateFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :start_date
  end
end
