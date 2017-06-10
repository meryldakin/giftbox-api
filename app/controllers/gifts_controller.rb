class GiftsController < ApplicationController
  def index
    gifts = Gift.all.includes(:exchanges)
    render json: gifts
  end

  def create
    gift = Gift.new(item: params[:item], price: params[:price], category: params[:category], link: params[:link])
    gift.save
    render json: gifts
  end

  def update

  end

  def show
    gift = Gift.find(params[:id])
    render json: gift
  end

  def delete

  end
end
