class UsersController < ActionController::Base

  # Route for user's show page is "/users/:username"
  def show
    @user = User.find_by(username: params[:username])
  end

  private

  def user_params
    params.require.(:user).permit(:username)
  end

end
