class AddCheckOutToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :check_out, :string
  end
end
