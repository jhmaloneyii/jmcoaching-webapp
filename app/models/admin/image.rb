class Admin::Image < ApplicationRecord
  mount_uploader :image, ImageUploader
end
