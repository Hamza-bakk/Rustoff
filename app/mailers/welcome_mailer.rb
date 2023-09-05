class WelcomeMailer < ApplicationMailer
  default from: 'RustOff@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue sur RustOff')
  end
end
