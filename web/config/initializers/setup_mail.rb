ActionMailer::Base.smtp_settings = {
  :address              => "sender.oxygencomputing.com",
  :port                 => 25,
  :domain               => "tideinstitute.org",
  :user_name            => "postman@sender.oxygencomputing.com",
  :password             => "!l0v3spams",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# class DevelopmentMailInterceptor
#   def self.delivering_email(message)
#     message.subject = "#{message.to} #{message.subject}"
#     message.to = "no-reply@tideinstitute.org"
#   end
# end
# 
ActionMailer::Base.default_url_options[:host] = "tideinstitute.org"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
