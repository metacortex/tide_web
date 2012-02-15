class ApplicationController < ActionController::Base
  protect_from_forgery

  
  # rescue_from ActiveRecord::RecordNotFound, :with => :content_404
  class PermissionException < Exception; end
  rescue_from PermissionException, :with => :not_authorized_action

  def check_permission(content, key = :user_id)
    raise PermissionException unless logged_in?
    unless current_user.admin?
      raise PermissionException unless current_user.id == content.send(key)
    end
    content
  end

	def not_authorized_action
	  msg = "not authorized action"
	  respond_to do |format|
	    format.html { render :text => msg, :status => :forbidden }
	    format.js   { render :js => "alert('#{msg}')" }
    end
	end

	helper_method :has_permission?

	def has_permission?(content, key = :user_id)
    return false unless logged_in?
    unless current_user.admin?
      return false unless current_user.id == content.send(key)
    end
    true
	end
	
	
	# sorcery callback
  def not_authenticated
    respond_to do |format|
      format.html {
        if params[:popup]
          redirect_to login_require_url
        else
          redirect_to login_url
        end
      }
      format.js { render :js => 'alert("Log-In Required")' }
    end
  end


  # admin
  def require_admin
    unless admin_logged_in?
      self.send(Config.not_authenticated_action)
    end
  end

  helper_method :admin_logged_in?
  
  def admin_logged_in?
    current_user && current_user.admin?
  end



  # return location
  helper_method :return_url
  
  def store_location
    session[:return_to] = request.referer
  end
  
  def return_url(url = nil)
    session[:return_to] || url
  end
  

end
