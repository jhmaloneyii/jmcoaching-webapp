json.extract! post, :id, :title, :content, :summary, :active, :image, :created_at, :updated_at
json.url post_url(post, format: :json)
