class CommentsController < ApplicationController
  
  before_filter :find_post
  
  
  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
    else
    end
  end
  
  


  protected
  
    def find_post
      @post = Post.find(params[:post_id])
    end
  
end
