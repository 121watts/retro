class UserMailer < ActionMailer::Base
  default from: "feels@turing.io"

  def daily_email(user)
    @user = user
    @url = 'http://localhost:3000/feels'
    
    mail(to: @user.email, subject: 'Time to Cop a Feel')
  end

  def welcome_email(user_id)
    binding.pry
    @user = User.find(user_id)
    @url = 'http://localhost:3000/feels'
    binding.pry 
    mail(to: @user.email, subject: 'Welcome to tinyFeels')
  end
end
