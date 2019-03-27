class SessionsController < ApplicationController
  # before_action :authorized comes from ApplicationController
  skip_before_action :authorized, only: [:new, :create, :home]

  def home
    @listings = Listing.all.find_all do |listing| listing.sale == nil end
    @listings = @listings.paginate(page: params[:page], per_page: 10)
    if params[:search]
      # @listings = Listing.search(params[:search]).paginate(page: params[:page], per_page: 10).order("created_at DESC")
      @listings = Listing.check_in_date(params[:search][:start_date]).paginate(page: params[:page]).order("check_in ASC")
    end
  end


  def new
    render :new #looks in app/views/sessions/new.html.erb
  end


  def create #handles the POST request to /login
    # find out if we have a user with this email

    @user = User.find_by(email: params[:email])

    # get that user record from DB
    # authenticate this user; determine if they provided the correct pw

    if @user && @user.authenticate(params[:password])
      # once we have found the user, create a new session for them
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to @user

    else
      flash[:notice] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
