class UsersController < ApplicationController
  # A user can visit the anything without logging in. That's because we have to add this method
  # to restrict users that are not logged in. The before_action.
  before_action :logged_in_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Si te registrabas te pedía que inicies sesión. Entonces agregamos: log_in @user
      log_in @user
      flash[:seccess] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
