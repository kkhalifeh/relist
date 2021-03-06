class ApplicationController < ActionController::Base
  before_action :authorized #lock down this whole app
  helper_method :current_user, :logged_in? #i can call current_user from a view
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def current_user
    # User.find would throw an error if we cannot find the user
    User.find_by({ id: session[:user_id] })
  end

  def logged_in?
    # nil is falsey in ruby
    # a user instance is truthy
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  #Trying to account for bad routes
  # def index
  #   flash.notice = 'No page found at that address'
  #   redirect_to listings_path
  # end

  private

  def record_not_found
    #for custom error page use comment below
    # render file: "#{Rails.root}/app/views/errors/404.erb", layout: true, status: :not_found
    flash.notice = 'No page found at that address'
    redirect_to listings_path
  end

end
