class PollsController < ApplicationController
  before_action :set_poll, only: :show
  before_action :set_polls, only: :index

  respond_to :json

  def index
  end
  
  def show
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      respond_with(@poll)
    else
      respond_with(@poll, status: 422)
    end
  end

private

  def poll_params
    params.permit(:title, :description, :status, :type, :duration, :creator_user_id)
  end

  def set_poll
    @poll = Poll.find_by_id(params[:id])
  end

  def set_polls
    @polls = Poll.all
  end
end
