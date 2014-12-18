class PollsController < ApplicationController
  after_action :add_callback

  def index
    render json: Poll.all, status: 200
  end
  
  def show
    @poll = Poll.find_by_id(params[:id])
    if params[:choices]
      render json: @poll.to_json(include: :choices)
    else
      render json: @poll, status: 200
    end
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      render json: @poll, status: 201
    else
      render json: @poll.errors, status: 422
    end
  end

private

  def poll_params
    params.permit(:title, :description, :status, :type, :expiration_date, :creator_user_id)
  end
end
