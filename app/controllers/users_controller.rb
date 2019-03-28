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
       session[:user_id] = @user.id
       redirect_to listings_path
     else
       flash[:notice] = "Form is invalid"
       flash[:color]= "invalid"
       render :new
     end
  end

  def show
    @user = User.find(params[:id])

  end

  def analytics
    render :analytics
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_photo)
  end


end
