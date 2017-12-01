CarrierWave.configure do |config|
  if ENV['AWS_ACCESS_KEY_ID'].present?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'eu-west-1'
    }
    config.storage = :fog
    config.fog_directory = 'yume-production'
    config.fog_authenticated_url_expiration = 120
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.days.to_i}" }
  else
    config.storage = :file
    config.enable_processing = !Rails.env.test?
    config.asset_host = ActionController::Base.asset_host
  end
end
