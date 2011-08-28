class CommentsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_post


  def index
    @comments = @post.comments.page(params[:page])
    render :json => @comments.to_json(:include => [:user])
  end

  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      render :json => @comment.to_json(:include => [:user])
    else
      render :json => @comment.errors
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    has_permission?(@comment, current_user)
    
    if @comment.update_attributes(params[:comment])
      render :json => @comment.to_json(:include => [:user])
    else
      render :json => @comment.errors
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    has_permission?(@comment, current_user)
    
    @comment.destroy
    
    render :json => @comment
  end




  protected
  
    def find_post
      @post = Post.find(params[:post_id])
    end
  
end
