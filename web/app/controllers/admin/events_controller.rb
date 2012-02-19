class Admin::EventsController < ApplicationController
  
  before_filter :require_admin
  layout "admin"

  
  def index
    @q = Event.search(params[:q])
    @events = @q.result.order("id DESC").page(params[:page])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    
    if @event.update_attributes(params[:event])
      redirect_to admin_events_path
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(params[:event])
      redirect_to admin_events_path
    else
      render :edit
    end
  end
  
  def destroy
    
  end


end
