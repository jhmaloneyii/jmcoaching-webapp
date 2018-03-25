Rails.application.routes.draw do

  resources :posts, path: 'blog'
  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
