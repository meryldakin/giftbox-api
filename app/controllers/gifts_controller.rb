class GiftsController < ApplicationController
  def index
    gifts = Gift.all.includes(:exchanges)
    render json: gifts
  end

  def create
    gift = Gift.new(item: params[:item], image: params[:image], link: params[:link])
    gift.save
    render json: gifts
  end

  def update
    gift = Gift.find(params[:gift_id])
    gift.item = params[:item]
    gift.image = params[:image]
    gift.link = params[:link]
    gift.save
    render json: gift
  end


  def show
    gift = Gift.find(params[:id])
    render json: gift
  end

  def delete

  end
end
