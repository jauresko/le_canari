class EpisodesController < ApplicationController
  layout 'reading'
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => :index

  def index
    @episodes = policy_scope(Episode).order(created_at: :desc)
  end

  def show
    @episode = Episode.find(params[:id])
    if @episode.sessions.index { |x| x.user_id == current_user.id } == nil
      @user = current_user
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
    end
    authorize(@episode)
  end

  def new
    @episode = Episode.new
    @book = Book.find(params[:book_id])
    authorize(@book)
  end


  def create
    @book = Book.find(params[:book_id])
    @episode = Episode.new(episode_params)
    @episode.book = @book
    if @episode.save
      redirect_to episode_path(@episode)
    else
      render :new
    end
  end


  private


  def episode_params
    params.require(:episode).permit(:title, :episode_number, pages: [])
  end


end
