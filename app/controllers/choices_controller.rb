class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :destroy]
  
  def index
    render json: Choice.all, status: 200, callback: params[:callback]
  end
  
  def show
    render json: @choice, status: 200, callback: params[:callback]
  end

  def create
    @choice = Choice.new(choice_params)

    if @choice.save
      render json: @choice, status: 201, callback: params[:callback]
    else
      render json: @choices.errors, status: 422, callback: params[:callback]
    end
  end

  def destroy
    @choice.destroy
    head :no_content, callback: params[:callback]
  end

private

  def choice_params
    params.permit(:value, :poll_id)
  end

  def set_choice
    @choice = Choice.find_by_id(params[:id])
  end
end
