class Post < ApplicationRecord
  mount_uploader :image, PostMainImageUploader
end
