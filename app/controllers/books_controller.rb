class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).premit(:title, :body, :image)
  end

end
