class UserMailer < ActionMailer::Base
  
  default from: "reid_m@icloud.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://rottenmangoes.com/login'
    mail(to: @user.email, subject: 'Welcome to Rotten Mangoes!')
  end

  def destroy_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sorry to see you go!')
  end

end
