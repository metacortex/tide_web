class Admin::VideosController < ApplicationController

  before_filter :require_admin
  layout "admin"


  def index
    @q = Video.search(params[:q])
    @videos = @q.result.order("created_at DESC").page(params[:page])
  end

  def show
    
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    
    if @video.save
      redirect_to admin_videos_path
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    
    if @video.update_attrbutes(params[:video])
      redirect_to admin_videos_path
    else
      render :edit
    end
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    
    redirect_to admin_videos_path
  end

end
