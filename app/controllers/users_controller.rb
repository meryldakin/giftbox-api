class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(firstName: params[firstName], lastName: params[lastName])
    user.save
    render json: users
  end

  def update

  end

  def show
    user = User.find(params[id])
    render json: user
  end


end
