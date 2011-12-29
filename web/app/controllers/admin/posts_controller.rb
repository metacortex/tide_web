class Admin::PostsController < ApplicationController
  
  before_filter :require_admin
  layout "admin"

  
  def index
  end

end
