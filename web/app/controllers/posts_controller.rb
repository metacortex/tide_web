class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  
  def index
    @posts = if current_user.try(:writer?)
      Post.page(params[:page])
    else
      Post.published.page(params[:page])
    end
  end
  
  def show
    @post = Post.includes(:comments).find(params[:id])
    
    unless @post.published? || current_user.try(:writer?)
      redirect_to :action => "index"
    end
    
    @agreements = if user_signed_in?
      current_user.agreements.where(:post_id => params[:id])
    else
      []
    end
  end
  
  def new
    return unless current_user.writer?

    @post = Post.new
  end
  
  def create
    return unless current_user.writer?

    if params[:post][:picture_image]
      params[:post][:remote_picture_image_url] = nil
    end
    @post = Post.new(params[:post])
    
    if @post.save
      redirect_to @post
    else
      render :action => "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    has_permission?(@post, current_user)
  end
  
  def update
    if params[:post][:picture_image]
      params[:post][:remote_picture_image_url] = nil
    end

    @post = Post.find(params[:id])
    has_permission?(@post, current_user)
    
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    has_permission?(@post, current_user)
    
    @post.destroy
    
    redirect_to :action => "index"
  end

end
