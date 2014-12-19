class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]
  before_action :set_votes, only: :index

  respond_to :json

  def index
  end

  def show
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      respond_with(@vote)
    else
      respond_with(@vote, status: 422)
    end
  end

  def update
    if @vote.update(vote_params)
      respond_with(@vote)
    else
      respond_with(@vote, status: 422)
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

  def set_votes
    @votes = Vote.all
  end
end
