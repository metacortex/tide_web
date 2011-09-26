class RegistrationsController < ApplicationController

  before_filter :find_event
  
  
  def index
    
  end
  
  def show
    
  end
  
  def create
    
  end
  
  
  
  protected
  
    def find_event
      @event = Event.find(params[:event_id])
    end

end
