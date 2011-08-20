class MainController < ApplicationController

  def index
    @events = Event.order("id DESC").limit(4)
  end

end
