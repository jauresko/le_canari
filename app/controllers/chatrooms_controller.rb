class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  layout 'chatroom', only: :show

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def new
    @chatroom = Chatroom.new
    authorize(@chatroom)
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
    authorize(@chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
