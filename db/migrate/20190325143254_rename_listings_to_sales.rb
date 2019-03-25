class RenameListingsToSales < ActiveRecord::Migration[5.2]
  def change
    rename_table :listings, :sales
  end
end
