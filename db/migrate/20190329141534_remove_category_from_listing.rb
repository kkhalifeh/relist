class RemoveCategoryFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :category_id
  end
end
