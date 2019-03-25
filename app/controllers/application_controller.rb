class ApplicationController < ActionController::Base

  def current_user
    User.find_by(email: 'rhettwilderman@schaden.com')
  end
  helper_method :current_user
end
