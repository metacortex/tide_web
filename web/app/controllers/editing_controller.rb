class EditingController < ApplicationController
  
  before_filter :require_login
  before_filter :check_editor!
  
  
  def index
    @posts = Post.not_published.order("id DESC").page(params[:page])
  end
  
  def all
    @posts = Post.order("id DESC").page(params[:page])
    render :action => "index"
  end
  
  def edit
    # raise unless current_user.editor?
    @post = Post.find(params[:id])
  end
  
  def update
    # raise unless current_user.editor?
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      
      if @post.published?
        @post.update_attribute :published_at, Time.now
      end
      
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end
  
  def writers
    @users = User.where("!isNull(role)")
  end
  
  def writer
    @user = User.find(params[:id])
  end
  
  
  
  protected
  
    def check_editor!
      current_user.editor?
    end


end
