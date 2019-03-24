class AddStartdateToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :startdate, :string
  end
end
