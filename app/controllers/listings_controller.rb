class ListingsController < ApplicationController
  def index
  end

  def create
    ##CHECK THESE METHODS BEFORE YOUN CONTINUE
    holiday = Holiday.find(params[:holiday_id])
    listing = holiday.create_listing(buyer_id: current_user.id)
    listing.seller_id = holiday.user_id

    if listing.save
      redirect_to holidays_path, notice: "You have just purchased this holiday from #{listing.seller.name}"
    else
      redirect_to holidays_path, notice: 'You cannot purchase your own holiday.'
    end
  end
end
