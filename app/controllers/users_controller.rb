class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :authorize_analytics, only: :analytics
  before_action :authorize_edit_user, only: :edit

  def authorize_edit_user
    if current_user != User.find(params[:id])
      flash[:notice] = "You are not authorized to update this user's profile"
      redirect_to user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)
    if @user.save
      flash[:notice] = "Updated profile successfully"
      flash[:color]= "valid"
      redirect_to user_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render :edit
    end
  end

  def authorize_analytics
    if current_user != User.find(params[:id])
      flash[:notice] = "You are not authorized to view this user's analytics"
      redirect_to listings_path
    end
  end

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

  # TO DO - REFACTOR THIS ISH
  def show
    if current_user.id == params[:id].to_i
      @my_past_listings = current_user.my_past_listings
      @my_past_stays = current_user.my_past_stays
      @active_listings = current_user.active_listings
      @all_active_bought_listings = current_user.all_active_bought_listings
    else
      @other_user = User.find(params[:id])
      @my_past_listings = @other_user.my_past_listings
      @my_past_stays = @other_user.my_past_stays
      @active_listings = @other_user.active_listings
      @all_active_bought_listings = @other_user.all_active_bought_listings
    end
  end

  def analytics
    @total_sales = current_user.total_sales
    @total_spent = current_user.total_spent
    @largest_discount = current_user.largest_discount
    @average_discount = current_user.average_discount
    @total_saved = current_user.total_saved
    @average_guests = current_user.average_guests
    render :analytics
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
