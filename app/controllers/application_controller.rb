class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find_by(email: 'wilburleffler@aufderharbuckridge.org')
  end
end
