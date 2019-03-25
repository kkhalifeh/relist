class RenameHolidayToListing < ActiveRecord::Migration[5.2]
  def change
    rename_table :holidays, :listings
  end
end
