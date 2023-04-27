class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all

    @user = current_user

  end

  def edit
    @book = Book.find(params[:id])
      unless @book.user.id == current_user.id
      redirect_to books_path
      end

  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
      @book = Book.find(params[:id])
      unless @book.user.id == current_user.id
        redirect_to books_path
      end
    if @book.update(book_params)
     redirect_to book_path, flash:{notice: "You have updated book successfully."}
    else
     render :edit
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end