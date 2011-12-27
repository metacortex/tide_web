class EventsController < ApplicationController
  
  def index
    @events = Event.order("opened_at DESC, id DESC").all
  end
  
  def show
    @event = Event.find(params[:id])
    @registration = @event.registrations.new
    @agreements = if logged_in?
      current_user.agreements.where(:event_id => params[:id])
    else
      []
    end
  end
  
end
