class WelcomeMailWorker
  include Sidekiq::Worker

  def perform(user_id)
    UserMailer.welcome_email(user_id).deliver
  end
end
