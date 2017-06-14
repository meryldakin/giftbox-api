class EventListsController < ApplicationController
  def index
    event_lists = EventList.all.includes(:celebrations)
    render json: event_lists
  end

  def create
    event_lists = EventList.all.includes(:celebrations)
    event_list = EventList.create(name: params[:name], category: params[:category], date: params[:date])
    user = User.find(params[:user_id])
    UsersEventList.create(user: user, event_list: event_list)
    render json: event_lists
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
