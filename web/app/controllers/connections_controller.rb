class ConnectionsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_user
  

  def index
    @connections = @user.connections
    
    respond_to do |format|
      format.html {}
      format.js   {}
    end
  end

  def create
    @connection = Connection.create(:user_id => params[:user_id], :target_id => params[:target_id])
  end



  
  protected
  
    def find_user
      @user = User.find(params[:user_id])
    end
  
end
