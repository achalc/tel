OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '417122608498927', '64e77b7989f7af40d7ab05d0014eac90'
end