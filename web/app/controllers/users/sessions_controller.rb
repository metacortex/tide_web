# encoding: UTF-8
class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  include Devise::Controllers::InternalHelpers

  # GET /resource/sign_in
  def new    
    clean_up_passwords(build_resource)
    render_with_scope :new
  end
end
