class EpisodesController < ApplicationController
  before_action :set_episode
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => :index

  def index
    @episodes = policy_scope(Episode).order(created_at: :desc)
  end

  def show
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

  def set_episode
    @episode = Episode.find(params[:id])
    authorize(@episode)
  end


  def episode_params
    params.require(:episode).permit(:title, :episode_number, pages: [])
  end


end
