class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  # version :standard do
  #   resize_to_fit 300, 400
  # end

  version :standard do
    cloudinary_transformation width: 400, height: 300, crop: :fill
  end

end
