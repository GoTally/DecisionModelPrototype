class UsersController < ApplicationController

  def index
    render json: User.all, status: 200
  end

  def show
    render json: User.find_by_id(params[:id]), status: 200
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 200
    else
      render json: @user.errors, status: 422
    end
  end

private

  def user_params
    params.permit(:first_name, :last_name)
  end
end
