class CommentsController < ApplicationController

  before_filter :require_login


  def index
    @content = eval(params[:content_type]).find(params[:content_id])
    @comments = @content.comments.as_root.includes(:user,:children).order("id DESC").page(params[:page]).per(params[:per])
  end

  def new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    @content = @comment.content
  end
  
  def destroy
    @comment = check_permission Comment.find(params[:id])
    
    if @comment.removable?
      @comment.destroy
      render :js => "$('##{dom_id(@comment)}').remove();"
    else
      render :js => "alert('error')";
    end
  end

end
