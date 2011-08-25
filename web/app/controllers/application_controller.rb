class ApplicationController < ActionController::Base
  protect_from_forgery

  
  class PermissionException < Exception; end
  rescue_from PermissionException, :with => :content_403
  def content_403
    render :text => "Permission Error", :layout => false
  end
  
  def has_permission?(content, user)
    raise PermissionException unless content.editable_to_user?(user)
  end
  

end
