CarrierWave.configure do |config|
  require 'carrierwave'
  
       # config.s3_access_key_id = "AKIAJITYSNB4IHHPX4KQ"
      # config.s3_secret_access_key = "trackkr1"
       # config.s3_bucket = "bookshelf_audio"
#      
  
  
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJITYSNB4IHHPX4KQ',       # required
    :aws_secret_access_key  => 'trackkr1',       # required
    #:region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'bookshelf_audio'                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

  