class UsersController < ApplicationController
  
  before_filter :require_login, :only => [:edit, :update, :destroy, :invite]

  
  def index
    @users = User.all
    @recent_users = User.recently_joined(10)
    @weekly_users = User.weekly_active(10)
  end
  
  def all
    @users = User.all
  end
  
  def search
    @users = User.all
  end
  
  def invite
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      render :js => "alert('Sign Up Success');close_modal('#signup_popup');"
    end
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
