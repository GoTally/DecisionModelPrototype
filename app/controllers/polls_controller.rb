class PollsController < ApplicationController

  def index
    render json: Poll.all, status: 200, callback: params[:callback]
  end
  
  def show
    @poll = Poll.find_by_id(params[:id])
    if params[:choices]
      render json: @poll.to_json(include: :choices), status: 200, callback: params[:callback]
    else
      render json: @poll, status: 200, callback: params[:callback]
    end
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      render json: @poll, status: 201, callback: params[:callback]
    else
      render json: @poll.errors, status: 422, callback: params[:callback]
    end
  end

private

  def poll_params
    params.permit(:title, :description, :status, :type, :expiration_date, :creator_user_id)
  end
end
