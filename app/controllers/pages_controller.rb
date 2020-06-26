class PagesController < ApplicationController
  skip_before_action :authenticate_user!


  def home
    @books = Book.last(20)
  end

  def payment
  end

  def checkout
  end

  def account_credit
    @token = params[:token]
    @authenticity_token = current_user.authentication_token
    redirect_to root_path if current_user.last_payment_token == params[:token]
  end

  def your_read
    @sessions = current_user.sessions
  end

end
