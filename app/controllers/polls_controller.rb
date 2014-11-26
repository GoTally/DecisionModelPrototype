class PollsController < ApplicationController

  def index
    render json: Poll.all, status: 200
  end
  
  def show
    render json: Poll.find_by_id(params[:id]), status: 200
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
