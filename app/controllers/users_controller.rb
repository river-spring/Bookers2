class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
    @book = Book.new
    @user = current_user
  	@users = User.all
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
      @user = User.find(params[:id])
      if @user != current_user
        redirect_to user_path(current_user)
      end
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render("users/edit")
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def zipedit
    params.require(:user).permit(:postcode, :prefecture, :city, :street)
  end
end
