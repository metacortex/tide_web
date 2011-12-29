class Admin::PostsController < ApplicationController
  
  before_filter :require_admin
  layout "admin"

  
  def index
    @q = Post.search_scope(params[:scope]).search(params[:q])
    @posts = @q.result.order("id DESC").page(params[:page])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attrbutes(params[:post])
      redirect_to admin_posts_path
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to admin_posts_path
  end


end
