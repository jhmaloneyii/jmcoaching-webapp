Rails.application.routes.draw do

  resources :product_types
  resources :products
  resources :tags

  devise_for :admins, :skip => [:registrations]

  resources :posts, path: 'blog'
  get 'blog_admin', to: 'posts#blog_admin'

  root to: 'static_pages#home'
  get 'athletes', to: 'static_pages#athletes'
  get 'coach', to: 'static_pages#coach'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
