CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_S3_REGION']
    }
    config.storage = :fog
    config.fog_directory = ENV['AWS_S3_BUCKET_NAME']
    config.fog_authenticated_url_expiration = 120
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.days.to_i}" }
  else
    config.storage = :file
    config.enable_processing = !Rails.env.test?
    config.asset_host = ActionController::Base.asset_host
  end
end
