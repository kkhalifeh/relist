class UsersController < ApplicationController
  def index
  end

  def new
   @user = User.new
  end

  def create
     @user = User.new(params[:user])
     if @user.save
       flash[:notice] = "You signed up successfully"
       flash[:color]= "valid"
     else
       flash[:notice] = "Form is invalid"
       flash[:color]= "invalid"
     end
     render :new
  end

  def show
    @listings = current_user.listings
    @listings_purchased = Listing.find_by({buyer_id: current_user.id})
    # byebug
  end


end
