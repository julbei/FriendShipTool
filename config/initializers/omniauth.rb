OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '539752212809915', 'd324d4cadf43d6d8a8bb2819d99aeab3'
end