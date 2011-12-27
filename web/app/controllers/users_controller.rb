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
    @user.email = ""
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Updated successfully"
    else
    end
    render :action => "edit_profile"
  end


end
