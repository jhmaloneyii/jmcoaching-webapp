class Admin::Image < ApplicationRecord
  mount_uploader :path, ImageUploader

  has_many :posts
end
