class ChoicesController < ApplicationController
  before_action :set_choice, only: [:show, :destroy]
  
  def index
    render json: Choice.all, status: 200
  end
  
  def show
    render json: @choice, status: 200
  end

  def create
    @choice = Choice.new(params[:value])

    if @choice.save
      render json: @choice, status: 201
    else
      render json: @choices.errors, status: 422
    end
  end

  def destroy
    @choice.destroy
    head :no_content
  end

private

  def set_choice
    @choice = Choice.find_by_id(params[:id])
  end
end
