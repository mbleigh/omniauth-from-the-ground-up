require 'dev_strategy'

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == 'development'
    provider :dev
  else
    provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], :force_login => true
  end
end

OmniAuth.configure do |config|
  config.on_failure do |env|
    raise env['omniauth.error']
  end
end
