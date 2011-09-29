class Users::RegistrationsController < Devise::RegistrationsController

  layout false


  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        # respond_with resource, :location => redirect_location(resource_name, resource)
        render :text => "alert('success');window.location.reload()"
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        # respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        render :text => "alert('Success');window.location.reload()"
      end
    else
      clean_up_passwords(resource)
      # respond_with_navigational(resource) { render_with_scope :new }
    end
  end

  
  protected

    def after_sign_up_path_for(resource)
      '/'
    end

end
