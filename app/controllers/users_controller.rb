class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@user = User.all
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  end
end
