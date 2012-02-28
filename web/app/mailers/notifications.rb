class Notifications < ActionMailer::Base
  default from: "no-reply@tideinstitute.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.reset_password.subject
  #
  def reset_password(user)
    @user = user
    @url  = "http://www.tideinstitute.org/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.signup.subject
  #
  def signup
    @greeting = "Hi"

    mail to: "to@example.org"
  end

end
