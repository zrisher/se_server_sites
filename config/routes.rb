Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #
  # Users
  #

  authenticated :user do
    root to: "users#dashboard", :as => :authenticated_root

    #resources :clans
  end

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'session', :to => 'devise/sessions#show', :as => :new_session
    get 'session', :to => 'devise/sessions#show', :as => :session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  match '/users/:id/finish_signup' => 'users#finish_signup',
        via: [:get, :patch], :as => :finish_signup

  #
  # App
  #

  resources :servers, only: [:show, :index]

  root to: 'servers#show', id: '1'

  get 'settings', to: 'servers#settings', id: '1'
  get 'rules', to: 'servers#rules', id: '1'
  get 'mods', to: 'servers#mods', id: '1'
  get 'roadmap', to: 'servers#roadmap', id: '1'
  get 'map', to: 'servers#map', id: '1'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
