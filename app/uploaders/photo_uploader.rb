# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'default_avatar.png'
  end

  # Create different versions of your uploaded files:
  version :large_avatar do
    process :resize_to_fill => [150, 150]
  end

  version :medium_avatar do
    process :resize_to_fill => [50, 50]
  end

  version :small_avatar do
    process :resize_to_fill => [35, 35]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
