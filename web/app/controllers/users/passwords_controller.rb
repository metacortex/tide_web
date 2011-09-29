class Users::PasswordsController < Devise::PasswordsController

  
  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if successful_and_sane?(resource)
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      # respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
      
      render :text => "alert('Check your mail box')"
    else
      # respond_with_navigational(resource){ render_with_scope :new }
      render :text => "alert('invalid email address')"
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
    render_with_scope :edit
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => redirect_location(resource_name, resource)
    else
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end


  protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      new_session_path(resource_name)
    end
    
end
