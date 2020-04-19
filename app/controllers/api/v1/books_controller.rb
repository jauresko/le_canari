class Api::V1::BooksController < Api::V1::BaseController
  # skip_after_action :verify_authorized

  def index
    @books = policy_scope(Book)
  end

  def show
  end

  def create
  end
end
