class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include Cloudinary::CarrierWave

  process :convert => 'png'

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    process :resize_to_fill => [50, 50, :north]
  end

end
