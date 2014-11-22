class MailWorker
  include Sidekiq::Worker

  def perform(user_id)
    binding.pry
    UserMailer.welcome_email(user_id).deliver
  end
end
