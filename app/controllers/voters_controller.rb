class VotersController < ApplicationController
  before_action :set_voter, only: :show
  before_action :set_voters, only: :index

  respond_to :json

  def index
  end

  def show
  end

  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      respond_with(@voter)
    else
      respond_with(@voter, status: 422)
    end
  end

private

  def voter_params
    params.permit(:poll_id, :user_id)
  end

  def set_voter
    @voter = Voter.find_by_id(params[:id])
  end

  def set_voters
    @voters = Voter.all
  end
end
