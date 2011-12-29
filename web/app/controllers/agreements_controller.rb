class AgreementsController < ApplicationController
  
  before_filter :require_login, :except => [:index]
  before_filter :find_comment, :except => [:index]


  def create
    if @agreement = @comment.agreements.find_by_user_id(current_user.id)
      @agreement.update_attributes(params[:agreement])
    else
      @agreement = Agreement.new(params[:agreement])
      @agreement.user_id = current_user.id
      @agreement.save
    end
  end


  protected
  
    def find_comment
      @comment = Comment.find(params[:comment_id])
    end


end
