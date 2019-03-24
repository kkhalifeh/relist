class ListingsController < ActionController::Base

  def index
    @active_listings = Listing.active_listings
  end

end
