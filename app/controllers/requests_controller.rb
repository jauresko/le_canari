class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = policy_scope(Request).order(created_at: :desc)
  end

  def new
    @request = Request.new
    authorize(@request)
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
    authorize(@request)
  end

  def show
    @request = Request.find(params[:id])
    authorize(@request)
  end
  private

  def request_params
    params.require(:request).permit(:name, :editor, :author, :drawer, :release_date, :collection, photos: [])
  end

end
