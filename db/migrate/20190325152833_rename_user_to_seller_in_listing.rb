class RenameUserToSellerInListing < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :seller_id, :seller_id
  end
end
