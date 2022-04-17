class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def create
    @booked = Book.new(book_params)
    @booked.user_id = current_user.id
    @user = current_user
    @book = Book.all
    if @booked.save
      flash[:ok] = "You have created book successfully."
      redirect_to book_path(@booked.id)
    else
      render :index
    end
  end

  def index
    @booked = Book.new
    @book = Book.all
    @user = current_user

  end

  def show
    @booked = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @booked = Book.find(params[:id])
  end

  def update
    @booked = Book.find(params[:id])
    if @booked.update(book_params)
      flash[:ok] = "You have updated book successfully."
      redirect_to book_path(@booked.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @booked = Book.find(params[:id])
    @user = @booked.user
    redirect_to(book_path) unless @user == current_user
  end

end
