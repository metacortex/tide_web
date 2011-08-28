class AgreementsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_comment, :except => [:index]


  def index
    @agreements = if user_signed_in?
      current_user.agreements.where(:post_id => params[:post_id])
    else
      []
    end
    render :json => @agreements
  end

  def create
    @agreement = Agreement.new(params[:agreement])
    
    if @agreement.save
      render :json => @agreement
    else
    end
  end

  def update
    @agreement = Agreement.find(params[:id])
    
    if @agreement.update_attributes(params[:agreement])
      render :json => @agreement
    else
    end
  end


  protected
  
    def find_comment
      @comment = Comment.find(params[:comment_id])
    end


end
