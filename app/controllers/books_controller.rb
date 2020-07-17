class BooksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @books = policy_scope(Book).search(params[:query])
    else
      @books = policy_scope(Book).order(created_at: :desc)
    end
  end

  def show
    @review = Review.new
    @session = Session.new
  end

  def new
    @book = Book.new
    authorize(@book)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
    authorize(@book)
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
    authorize(@book)
  end


  def book_params
    params.require(:book).permit(:name, :editor, :author, :drawer, :release_date, :collection, :category, :synopsis, :cover)
  end
end
