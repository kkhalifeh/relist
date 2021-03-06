class SessionsController < ApplicationController
  # before_action :authorized comes from ApplicationController
  skip_before_action :authorized, only: [:new, :create, :home]

  def home

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
