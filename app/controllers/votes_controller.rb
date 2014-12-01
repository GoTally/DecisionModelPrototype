class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

  def index
    render json: Vote.all, status: 200, callback: params[:callback]
  end

  def show
    render json: @vote, status: 200, callback: params[:callback]
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: 201, callback: params[:callback]
    else
      render json: @vote.errors, status: 422, callback: params[:callback]
    end
  end

  def update
    if @vote.update(vote_params)
      render @vote, status: 200, callback: params[:callback]
    else
      render @vote.errors, status: 422, callback: params[:callback]
    end
  end

  def destroy
    @vote.destroy
    head :no_content, callback: params[:callback]
  end

private

  def vote_params
    params.permit(:choice_id, :user_id)
  end

  def set_vote
    @vote = Vote.find_by_id(params[:id])
  end
end
