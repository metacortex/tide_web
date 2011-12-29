class OauthsController < ApplicationController

  skip_before_filter :require_login


  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to return_url(root_url), :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = find_or_create_from(provider)
        # @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end


  protected

  def find_or_create_from(provider)
    provider = provider.to_sym
    @provider = Config.send(provider)
    @user_hash = @provider.get_user_hash
    config = user_class.sorcery_config
    attrs = {}
    @provider.user_info_mapping.each do |k,v|
      if (varr = v.split("/")).size > 1
        attribute_value = varr.inject(@user_hash[:user_info]) {|hsh,v| hsh[v] } rescue nil
        attribute_value.nil? ? attrs : attrs.merge!(k => attribute_value)
      else
        attrs.merge!(k => @user_hash[:user_info][v])
      end
    end
    
    user_class.transaction do
      unless @user = User.find_by_email(attrs[:email])
        @user = user_class.new()
        attrs.each do |k,v|
          @user.send(:"#{k}=", v)
        end
        @user.save(:validate => false)
      end
      user_class.sorcery_config.authentications_class.create!({config.authentications_user_id_attribute_name => @user.id, config.provider_attribute_name => provider, config.provider_uid_attribute_name => @user_hash[:uid]})
    end

    @user
  end

end
