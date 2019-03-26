class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
  end

  def new
   @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
       flash[:notice] = "You signed up successfully"
       flash[:color]= "valid"
       redirect_to login_path
     else
       flash[:notice] = "Form is invalid"
       flash[:color]= "invalid"
       render :new
     end
  end

  def show
    @my_past_listings = current_user.my_past_listings
    @my_past_stays = current_user.my_past_stays
    @active_listings = current_user.active_listings
    @all_active_bought_listings = current_user.all_active_bought_listings
  end

  def analytics
    @total_sales = current_user.total_sales
    @total_spent = current_user.total_spent
    @largest_discount = current_user.largest_discount
    @average_discount = current_user.average_discount
    @total_saved = current_user.total_saved
    render :analytics
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
