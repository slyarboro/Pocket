class UserMailer < ApplicationMailer

  default from: 'hellofriend@pocketfurlater.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Greetings from Pocket!')
end
