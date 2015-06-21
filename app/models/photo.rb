class Photo < ActiveRecord::Base
  belongs_to :album
  validates :album, presence: true

  mount_uploader :image, PhotoUploader
end
