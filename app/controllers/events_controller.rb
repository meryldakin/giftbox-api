class EventsController < ApplicationController
  def index
    events = Event.all
    render json: events
  end

  def create
    event = Event.new(name: params[:name], month: params[:month], day: params[:day], year: params[:year], date: params[:date], type: params[:type])
    event.save
    render json: events
  end

  def update

  end

  def show
    event = Event.find(params[:id])
    render json: event
  end
  def delete

  end
end
