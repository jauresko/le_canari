class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user
    @book.sum_rating = @review.rating + @book.sum_rating
    @book.rating_number = @book.rating_number + 1
    @book.average_rating = @book.sum_rating / @book.rating_number
    if @review.save && @book.save
      redirect_to book_path(@book)
    else
      flash[:alert] = "Something went wrong."
    end
    authorize(@review, @book)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
