Rails.application.routes.draw do

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  #admin routes
  namespace :admin do
    get '/', to: 'admin#home'
    resources :product_types
    resources :products
    resources :tags
    resources :posts, path: 'blog'
  end

  #different authentication models - devise
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  devise_for :admins, :skip => [:registrations]

  resources :posts, path: 'blog', only: [:index, :show]
  resources :products, path: 'store', only: [:index, :show]
  resources :tags, only: [:index, :show]


  root to: 'static_pages#home'
  get 'athletes', to: 'static_pages#athletes'
  get 'coach', to: 'static_pages#coach'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
