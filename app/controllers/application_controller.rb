class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find_by(email: 'jonsauer@runtemarvin.co')
  end
end
