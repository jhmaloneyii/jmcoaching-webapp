Rails.application.routes.draw do

  devise_for :admins

  resources :posts, path: 'blog'
  get 'blog_admin', to: 'posts#blog_admin'

  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
