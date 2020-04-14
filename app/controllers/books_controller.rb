class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => :index
  skip_before_action :authenticate_user!, :only => :show

  def index
    @books = Book.all
  end

  def show
    @review = Review.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book.update(book_params)
    redirect_to book_path(@book)

  end

  def detroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end


  def book_params
    params.require(:book).permit(:name, :editor, :author, :drawer, :release_date, :collection, photos: [])
  end
end
