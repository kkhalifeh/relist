class AddListingToSale < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :listing, foreign_key: true
  end
end
