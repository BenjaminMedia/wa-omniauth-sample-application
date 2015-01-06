Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bonnier_oauth2, Rails.application.secrets.bonnier_key, Rails.application.secrets.bonnier_secret
end
