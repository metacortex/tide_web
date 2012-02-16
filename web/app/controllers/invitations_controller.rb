# encoding: UTF-8

class InvitationsController < ApplicationController

  before_filter :require_login, :except => [:show]


  def show
    @invitation = Invitation.not_accepted.where(:code => params[:id]).first
    
    if @invitation
      @invitation.accept!
      redirect_to new_user_registration_path
    else
      render :text => "Invalid Invitation Code."
    end
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.save
  end

  def create_multiple
    h = params[:invitation].values
    users = User.where(:email => h.map {|t| t["email"]}).map(&:email)
    
    ivs = h.select {|t| !users.include?(t["email"]) }
    c = 0

    ivs.each do |iv|
      inv = Invitation.new(iv)
      inv.user_id = current_user.id
      if inv.save
        c += 1
      end
    end

    flash[:notice] = "#{c} 명에게 초대 메일을 발송하였습니다."
    redirect_to invite_users_path
  end




end
