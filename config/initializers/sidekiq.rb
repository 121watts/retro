schedule_file = 'config/sidekiq_schedule.yml'

if File.exists?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
