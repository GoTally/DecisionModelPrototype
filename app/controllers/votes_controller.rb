class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

  def index
    render json: Vote.all, status: 200
  end

  def show
    render json: @vote, status: 200
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: 201
    else
      render json: @vote.errors, status: 422
    end
  end

  def update
    if @vote.update(vote_params)
      render @vote, status: 200
    else
      render @vote.errors, status: 422
    end
  end

  def destroy
    @vote.destroy
    head :no_content
  end

private

  def vote_params
    params.permit(:choice_id, :user_id)
  end

  def set_vote
    @vote = Vote.find_by_id(params[:id])
  end
end
