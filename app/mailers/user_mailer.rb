class UserMailer < ApplicationMailer
  default from: 'rustoffgp@proton.me'
=begin
  
rescue => exception
  
end
    def welcome_email(user)
      @user = user
      @url  = 'www.rustoff-621db6cfed24.herokuapp.com'
  
      mail(to: @user.email, subject: 'Bienvenue chez nous!', :host => 'www.rustoff-621db6cfed24.herokuapp.com')
    end
  end
end
=end