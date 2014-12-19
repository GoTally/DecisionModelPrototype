class UsersController < ApplicationController
  before_action :set_users, only: :index
  before_action :set_user, only: :show
  after_action :add_callback

  respond_to :json

  def index
    if params[:first_name] && params[:last_name]
      @users = @users.where(first_name: params[:first_name], last_name: params[:last_name])
    end
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_with(@user)
    else
      respond_with(@user, status: 422)
    end
  end

private

  def user_params
    params.permit(:first_name, :last_name, :age, :gender)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def set_users
    @users = User.all
  end
end
