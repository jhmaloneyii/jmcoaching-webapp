Rails.application.routes.draw do

  resources :tags

  devise_for :admins, :skip => [:registrations]

  resources :posts, path: 'blog'
  get 'blog_admin', to: 'posts#blog_admin'

  root to: 'static_pages#home'
  get 'coaches', to: 'static_pages#coaches'
  get 'coaches/caleb', to: 'static_pages#caleb'
  get 'coaches/sam', to: 'static_pages#sam'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
