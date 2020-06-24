class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = current_user
    @episode = Episode.find(params[:episode_id])
    @book = Book.find(params[:book_id])
    @session = Session.new
    @session.user = @user
    @session.episode = @episode
    @user.coins = @user.coins - 100
    if @user.coins < 0
      redirect_to payment_path
    else
      if @session.save && @user.save
        redirect_to book_episode_path(@book, @episode)
      else
        redirect_to book_path(@book)
      end
    end
    authorize(@episode)
  end

end
