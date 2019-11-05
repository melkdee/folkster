class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  mount_uploader :picture, PictureUploader
end
