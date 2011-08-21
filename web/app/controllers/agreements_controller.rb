class AgreementsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_comment


  def create
    unless @agreement = Agreement.where(:user_id => current_user.id, :comment_id => params[:comment_id]).first
      @agreement = Agreement.new(
        :user_id => current_user.id,
        :comment_id => params[:comment_id],
        :post_id => params[:post_id],
        :event_id => params[:event_id]
      )
    end
    @agreement.direction = params[:direction]
    @agreement.save
    @comment.reload
  end



  protected
  
    def find_comment
      @comment = Comment.find(params[:comment_id])
    end


end
