class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:title, :body)
  end

end
