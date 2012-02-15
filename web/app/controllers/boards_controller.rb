class BoardsController < ApplicationController
  
  before_filter :require_login, :only => [:new,:create,:edit,:update,:destroy]


  def index
    @q = Board.search(params[:q])
    @boards = @q.result.order("id DESC").page(params[:page])
  end

  def new
  end

  def edit
  end

end
