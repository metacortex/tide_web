class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.includes(:comments).find(params[:id])
    @agreements = if user_signed_in?
      current_user.agreements.where(:post_id => @post.id)
    else
      []
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    
    if @post.save
      redirect_to @post
    else
      render :action => "new"
    end
  end

end
