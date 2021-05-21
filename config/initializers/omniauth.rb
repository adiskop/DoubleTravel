Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  end

  #this file will push the request to facebook with our key and secret.