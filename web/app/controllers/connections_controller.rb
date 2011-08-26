class ConnectionsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_user
  

  def create
    @connection = Connection.create(:user_id => params[:user_id], :target_id => params[:target_id])
  end



  
  protected
  
    def find_user
      @user = User.find(params[:user_id])
    end
  
end
