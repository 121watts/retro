class DailyMailDelegateWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      DailyMailWorker.perform_async(user.id)
    end
  end
end
