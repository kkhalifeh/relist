class SalesController < ApplicationController
  def index
  end

  def create
    ##CHECK THESE METHODS BEFORE YOUN CONTINUE
    listing = Listing.find(params[:listing_id])
    # byebug
    sale = listing.create_sale(buyer_id: current_user.id)
    sale.seller_id = listing.seller_id

    if sale.save
      redirect_to listings_path, notice: "You have just purchased this listing from #{sale.seller.name}"
    else
      redirect_to listings_path, notice: 'You cannot purchase your own listing.'
    end
  end
end
