class AddEnddateToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :enddate, :string
  end
end
