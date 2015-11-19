OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '420120278199160', 'fd1a499ce0c4ccfb83061b07f07c17da'
end