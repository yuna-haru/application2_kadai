class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

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

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path) unless @user == current_user
  end

end
