class ConnectionsController < ApplicationController
  
  before_filter :require_login
  before_filter :find_user
  

  def index
    @connections = @user.connections
    
    respond_to do |format|
      format.html {}
      format.js   {}
    end
  end

  def new
    @target = User.find(params[:target_id])
    @connection = Connection.new(:target_id => params[:target_id], :user_id => params[:user_id])
    
    render :partial => "form"
  end

  def create
    @connection = Connection.new(params[:connection])
    @target = @connection.target

    @connection.save
  end




  protected
  
    def find_user
      @user = User.find(params[:user_id])
    end
  
end
