class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user
    if @review.save
      redirect_to book_path(@book)
    else
      flash[:alert] = "Something went wrong."
      render 'books/show'
    end
    authorize(@book, @review)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
