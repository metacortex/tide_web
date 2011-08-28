class CommentsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_post


  def index
    @comments = @post.comments.page(params[:page])
    render :json => @comments.to_json(:include => [:user])
  end

  def show
    @comment = Comment.find(params[:id])
    @agreements = current_user.agreements.where(:post_id => params[:post_id], :comment_id => params[:id])
  end
  
  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      render :json => @comment.to_json(:include => [:user])
    else
      render :json => @comment.errors.to_json
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
