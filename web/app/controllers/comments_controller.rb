class CommentsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_post


  def show
    @comment = Comment.find(params[:id])
    @agreements = current_user.agreements.where(:post_id => params[:post_id], :comment_id => params[:id])
  end
  
  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
    else
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
    has_permission?(@comment, current_user)
  end
  
  def update
    @comment = Comment.find(params[:id])
    has_permission?(@comment, current_user)
    
    @comment.update_attributes(params[:comment])
    @agreements = current_user.agreements.where(:post_id => params[:post_id], :comment_id => params[:id])
    render :action => "show"
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    has_permission?(@comment, current_user)
    
    @comment.destroy
  end
  
  


  protected
  
    def find_post
      @post = Post.find(params[:post_id])
    end
  
end
