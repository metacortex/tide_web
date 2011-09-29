# encoding: UTF-8
class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers
  
  layout false

  # GET /resource/sign_in
  def new    
    clean_up_passwords(build_resource)
    render_with_scope :new
  end
  
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "Users/Sessions#failure")
    return sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    
    # return render :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
    render :text => "window.location.reload()"
  end

  def failure
    # return render :json => {:success => false, :errors => ["Login failed."]}
    render :text => "alert('Login failed.')"
  end
  
end
