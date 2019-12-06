class UsersController < ApplicationController
  def index
    user = User.where("username LIKE ?", params[:username])
    if user.empty?
      render json: User.all
    else
      render json: user
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: params
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_url
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end

end
