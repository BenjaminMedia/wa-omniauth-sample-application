Bonnier.configure do |config|
  config.client_id     = Rails.application.secrets.bonnier_key
  config.client_secret = Rails.application.secrets.bonnier_secret
end
