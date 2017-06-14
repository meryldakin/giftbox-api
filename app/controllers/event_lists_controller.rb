class EventListsController < ApplicationController
  def index
    event_lists = EventList.all.includes(:celebrations)
    render json: event_lists
  end

  def create
    event_list = EventList.new(name: params[:name], category: params[:category], day: params[:day], month: params[:month])
    event_list.save
    render json: event_list
  end

  def update

  end

  def show
    event_list = EventList.find(params[:id])
    render json: event_list
  end
  def delete

  end
end
