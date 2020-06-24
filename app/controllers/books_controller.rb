class BooksController < ApplicationController
  def index
  	@book = Book.all
  end
  def new
  	@book = Book.new
  end
  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path
  end
  def show
  	@book = Book.find(params[:id])
  end

  def edit
  end
  private
  def book_params
  	params.require(:list).permit(:title, :body)
  end
end
