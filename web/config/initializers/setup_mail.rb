ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "tideinstitute.org",
  :user_name            => "tideinstitute",
  :password             => "tideinst",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = "tideinstitute@tideinstitute.org"
  end
end

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
