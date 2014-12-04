class UserMailer < ActionMailer::Base
  default from: "feels@allthefeels.website"

  def daily_email(user_id)
    @user = User.find(user_id)
    @url = 'http://www.allthefeels.website/feels'
    @old_feels = Feel.where(created_at: Date.today - 49)
    
    mail(to: @user.email, subject: "Daily feel reminder for #{Date.today}")
  end

  def welcome_email(user_id)
    @user = User.find(user_id)
    @url = 'http://www.allthefeels.website/feels'
    mail(to: @user.email, subject: 'Welcome to allthefeels')
  end
end
