class Post < ApplicationRecord
  validates :title, :content, presence: true
  validates_inclusion_of :active, in: [true, false]
  validates :summary, length: {maximum: 200}

  has_and_belongs_to_many :tags
end
