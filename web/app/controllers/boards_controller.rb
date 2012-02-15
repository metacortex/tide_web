class BoardsController < ApplicationController
  
  before_filter :require_login, :only => [:new,:create,:edit,:update,:destroy]


  def index
    @q = Board.search(params[:q])
    @boards = @q.result.order("id DESC").page(params[:page])
  end
  
  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(params[:board])
    
    if @board.save
      redirect_to @board
    else
      render :new
    end
  end

  def edit
    @board = check_permission Board.find(params[:id])
  end
  
  def update
    @board = check_permission Board.find(params[:id])
    
    if @board.update_attributes(params[:board])
      redirect_to @board
    else
      render :edit
    end
  end
  
  def destroy
    @board = check_permission Board.find(params[:id])
    @board.destroy
    
    redirect_to :index
  end

end
