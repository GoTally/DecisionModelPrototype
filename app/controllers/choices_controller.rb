class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :destroy]
  before_action :set_choices, only: :index

  respond_to :json
  
  def index
    # This needs to be come a nested resource
    if params[:poll_id]
      @choices = @choices.where(poll_id: params[:poll_id])
    end
  end
  
  def show
  end

  def create
    @choice = Choice.new(choice_params)

    if @choice.save
      respond_with(@choice)
    else
      respond_with(@choice, status: 422)
    end
  end

  def destroy
    @choice.destroy
    head :no_content
  end

private

  def choice_params
    params.permit(:value, :poll_id)
  end

  def set_choice
    @choice = Choice.find_by_id(params[:id])
  end

  def set_choices
    @choices = Choice.all
  end
end
