class UsersController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:edit_profile, :update_profile]

  
  def index
    @users = User.all
  end
  
  def all
    @users = User.all
  end
  
  def search
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit_profile
    @user = current_user
  end
  
  def update_profile
    @user = current_user
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Updated successfully"
    else
    end
    render :action => "edit_profile"
  end


end
