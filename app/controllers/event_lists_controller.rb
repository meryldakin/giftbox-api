class EventListsController < ApplicationController

  def index

    render json: EventList.all.includes(:celebrations)
  end

  def create
    user = User.find(params[:current_user_id])
    event_list = EventList.create(name: params[:name], category: params[:category], date: params[:date], user: user)
    render json: event_list
  end

  def update
    event_list = EventList.find(params[:id])
    event_list.name = params[:name]
    event_list.category = params[:category]
    event_list.date = Date.parse(params[:date])
    event_list.save
    render json: event_list
  end



  def show
    event_list = EventList.find(params[:id])
    render json: event_list
  end

  def edit_completed
    event_list = EventList.find(params[:event_list_id])
    event_list.completed = params[:completed]
    event_list.save
    render json: event_list

  end

  def user
    user = User.find(params[:id])
    event_lists = EventList.where(user: user)
    events_and_celebrations = event_lists.includes(:celebrations)
    render json: events_and_celebrations
  end

end
