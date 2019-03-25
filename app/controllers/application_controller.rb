class ApplicationController < ActionController::Base

  def current_user
    User.find_by(email: 'khaled@gmail.com')
  end
  helper_method :current_user
end
