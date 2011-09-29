class EventsController < ApplicationController
  
  def index
    @events = Event.order("id DESC").all
  end
  
  def show
    @event = Event.find(params[:id])
    @registration = @event.registrations.new
  end
  
end
