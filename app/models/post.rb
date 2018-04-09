class Post < ApplicationRecord
  mount_uploader :image, PostMainImageUploader

  validates :title, :content, presence: true
  validates :summary, length: {maximum: 200}

  has_and_belongs_to_many :tags
end
