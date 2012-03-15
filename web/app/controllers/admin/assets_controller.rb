class Admin::AssetsController < ApplicationController

  before_filter :require_admin
  layout "admin"


  def index
    @q = Asset.search(params[:q])
    @assets = @q.result.order("created_at DESC").page(params[:page])
  end

  def show

  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(params[:asset])

    if @asset.save
      redirect_to admin_assets_path
    else
      render :new
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])

    if @asset.update_attributes(params[:asset])
      redirect_to admin_assets_path
    else
      render :edit
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    redirect_to admin_assets_path
  end

end
