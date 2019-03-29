class SalesController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    sale = listing.create_sale(buyer_id: current_user.id)
    sale.seller_id = listing.seller_id

    if sale.save
      redirect_to listings_path, notice: "You have just purchased this listing from #{sale.seller.name}"
    else
      redirect_to listings_path, notice: 'You cannot purchase your own listing.'
    end
  end
end
