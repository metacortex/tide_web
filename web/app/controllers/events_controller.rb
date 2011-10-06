class EventsController < ApplicationController
  
  def index
    @events = Event.order("id DESC").all
  end
  
  def show
    @event = Event.find(params[:id])
    @registration = @event.registrations.new
    @agreements = if user_signed_in?
      current_user.agreements.where(:event_id => params[:id])
    else
      []
    end
  end
  
end
