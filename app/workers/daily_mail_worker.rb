class DailyMailWorker
  include Sidekiq::Worker

  def perform(user_id)
    UserMailer.daily_email(user_id).deliver
  end
end
