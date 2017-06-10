class EventsController < ApplicationController
  def index
    events = Event.all.includes(:celebrations)
    render json: events
  end

  def create
    event = Event.new(name: params[:name], date: params[:date], type: params[:type])
    event.save
    render json: event
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
