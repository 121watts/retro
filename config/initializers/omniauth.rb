Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_ID_LOCAL'], ENV['GITHUB_SECRET_LOCAL']
  OmniAuth.config.logger = Rails.logger
end

