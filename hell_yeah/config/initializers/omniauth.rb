OmniAuth.configure do |config|
  config.on_failure do |env|
    raise env['omniauth.error']
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
