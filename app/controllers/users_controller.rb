class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
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
