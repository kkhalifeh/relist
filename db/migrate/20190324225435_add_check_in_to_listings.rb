class AddCheckInToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :check_in, :string
  end
end
