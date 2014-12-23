class VotersController < ApplicationController
  respond_to :json

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
end
