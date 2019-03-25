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
    @my_past_listings = current_user.my_past_listings
    @my_past_stays = current_user.my_past_stays
    @active_listings = current_user.active_listings
    @all_active_bought_listings = current_user.all_active_bought_listings
  end


end
