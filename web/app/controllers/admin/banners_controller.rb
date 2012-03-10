class Admin::BannersController < ApplicationController

  before_filter :require_admin
  layout "admin"


  def index
    @banners = Banner.all
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner])
    
    if @banner.save
      redirect_to admin_banners_path
    else
      render :new
    end
  end
  
  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    
    if @banner.update_attributes(params[:banner])
      redirect_to admin_banners_path
    else
      render :edit
    end
  end
  
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    
    redirect_to admin_banners_path
  end


end
