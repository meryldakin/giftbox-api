class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create

  end

  def add_friend
    user = User.first
    user.add_friend(params[:first_name], params[:last_name], params[:birthday], params[:notes], params[:events])
    render json: User.all
  end

  def update

  end

  def show
    user = User.find(params[:id])
    render json: user
  end


end
