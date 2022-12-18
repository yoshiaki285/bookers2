class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path(user.id), notice: "You have updated user successfully."
  end

  private

  def user_params
    params.require(:user).permit(:title, :introduction, :profile_image)
  end

end
