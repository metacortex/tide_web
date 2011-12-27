class SessionsController < ApplicationController

  def new
    store_location
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to return_url(root_url), :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
