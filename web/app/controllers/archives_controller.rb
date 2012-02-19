class ArchivesController < ApplicationController

  def index
    render :photos
  end

  def photos
  end

  def documents
    @assets = Asset.order("id DESC").page(params[:page])
  end

  def videos
    @videos = Video.order("id DESC").page(params[:page])
  end

end
