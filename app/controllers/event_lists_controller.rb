class EventListsController < ApplicationController
  def index
    event_lists = EventList.all.includes(:celebrations)
    render json: event_lists
  end

  def create
    byebug
    event_lists = EventList.all.includes(:celebrations)
    event_list = EventList.create(name: params[:name], category: params[:category], date: params[:date])
    user = User.find(params[:current_user_id])
    UsersEventList.create(user: user, event_list: event_list)
    render json: event_lists
  end

  def update
    event_lists = EventList.all.includes(:celebrations)
    event_list = EventList.find(params[:id])
    event_list.name = params[:name]
    event_list.category = params[:category]
    event_list.date = Date.parse(params[:date])
    event_list.save
    render json: event_lists

  end

  def show
    event_list = EventList.find(params[:id])
    render json: event_list
  end

  def edit_completed
    event_list = EventList.find(params[:event_list_id])
    event_list.completed = params[:completed]
    event_list.save
    render json: EventList.all.includes(:celebrations)

  end

end
