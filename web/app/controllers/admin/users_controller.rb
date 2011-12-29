class Admin::UsersController < ApplicationController
  
  before_filter :require_admin
  layout "admin"

  
  def index
    @q = User.search_scope(params[:scope]).search(params[:q])
    @users = @q.result.order("id DESC").page(params[:page])
  end
  
  def show
    redirect_to edit_admin_user_path(:id => params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path
    else
      render :edit
    end
  end


end
