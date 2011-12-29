class SessionsController < ApplicationController

  layout false


  def new
    store_location
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      render :js => "window.location.reload();"
    else
      render :js => "alert('Email or password was invalid.');"
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
