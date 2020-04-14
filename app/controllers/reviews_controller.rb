class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    if @review.save
      redirect_to book_path(@book)
    else
      render 'books/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
