class ArchivesController < ApplicationController

  def index
    render :photos
  end

  def photos
  end

  def documents
    @assets = Asset.page(params[:page])
  end

  def videos
    @videos = Video.page(params[:page])
  end

end
