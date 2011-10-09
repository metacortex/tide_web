class MainController < ApplicationController

  def index
    @events = Event.order("opened_at DESC, id DESC").limit(4)
  end

end
