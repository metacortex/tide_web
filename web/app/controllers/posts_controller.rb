class PostsController < ApplicationController
  
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]
  
  
  def index
    @posts = if current_user && current_user.editor?
      Post.order("id DESC").page(params[:page])
    else
      Post.published.order("id DESC").page(params[:page])
    end
  end
  
  def show
    @post = Post.includes(:comments).find(params[:id])
    
    if @post.rejected?
      redirect_to posts_path
      return
    end
    
    @agreements = if logged_in?
      current_user.agreements.where(:post_id => params[:id])
    else
      []
    end
  end
  
  def new
    # return unless current_user.editor?
    @post = Post.new
  end
  
  def create
    # return unless current_user.editor?

    if params[:post][:picture_image]
      params[:post][:remote_picture_image_url] = nil
    end
    @post = Post.new(params[:post])
    
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end
  
  def edit
    @post = check_permission Post.find(params[:id])
  end
  
  def update
    if params[:post][:picture_image]
      params[:post][:remote_picture_image_url] = nil
    end

    @post = check_permission Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post = check_permission Post.find(params[:id])
    @post.destroy
    
    redirect_to :action => "index"
  end

end
