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
    # invoice = Paydunya::Checkout::Invoice.new
    # @result = invoice
    # if invoice.confirm(token)
    #   if invoice.status === "completed"
    #     current_user.coins = current_user.coins + invoice.total_amount
    #     current_user.save!
    #     puts "Well credit"
    #   else
    #     redirect_to payment_path, notice: invoice.response_text
    #   end
    # end
  end

end
