class StoresController < ApplicationController
  def index
    stores = Store.all
    render json: stores
  end

  def create
    store = Store.new(name: params[:name], website: params[:website])
    store.save
    render json: stores
  end

  def update

  end

  def show
    store = Store.find(params[:id])
    render json: store
  end
  def delete

  end
end
