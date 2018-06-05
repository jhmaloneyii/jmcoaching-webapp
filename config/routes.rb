Rails.application.routes.draw do

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  #admin routes
  namespace :admin do
    get '/', to: 'admin#home'
    resources :posts, path: 'blog', except: [:show]
    resources :product_types
    resources :products
    resources :tags
    resources :images
    end

  #different authentication models - devise
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  devise_for :admins, :skip => [:registrations]

  resources :posts, path: 'blog', only: [:index, :show]
  resources :products, path: 'store', only: [:index, :show]
  resources :tags, only: [:index, :show]


  #main pages
  root to: 'static_pages#home'
  get 'athletes', to: 'static_pages#athletes'
  get 'coach', to: 'static_pages#coach'

  #subpages
  get 'trainingplans', to: 'static_pages#training_plans'
  get 'personalcoaching', to: 'static_pages#personal_coaching'
  get 'advisercoaching', to: 'static_pages#adviser_coaching'
  get 'fullcoaching', to: 'static_pages#full_coaching'
  get 'coachingphilosophy', to: 'static_pages#coaching_philosophy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
