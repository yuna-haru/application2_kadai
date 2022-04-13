class UsersController < ApplicationController

  def index
    @booked = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @booked = Book.new
    @user = User.find(params[:id])
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :text)
  end

end
