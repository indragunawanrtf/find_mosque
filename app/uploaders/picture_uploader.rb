class PictureUploader < CarrierWave::Uploader::Base
  # include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_picture']
  
  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end
  
  version :thumbnail do
    process :resize_to_fill => [50, 50, :north]
  end
  
end
