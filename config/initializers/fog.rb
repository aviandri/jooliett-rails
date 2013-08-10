CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJOMKNY4CUYIH23UA',                        # required
    :aws_secret_access_key  => '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',
    :region                 => 'ap-southeast-1'                        # required    
  }
  config.fog_directory  = 'jooliett'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=31536000'}  # optional, defaults to {}
end