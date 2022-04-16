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
    if @user.update(user_params)
      flash[:ok] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
