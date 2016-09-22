Rails.application.routes.draw do

  get 'welcome/home'
  # get 'users/:id'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, only: [:show, :edit, :update, :destroy]

  resources :users, controller: "users", only: [:create, :edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/listings' => "listings#index"
  get '/listings/new'
  post '/listings' => "listings#create"
  get 'listings/:id' => "listings#show", as: "listing"
  get '/listings/:id/edit' => "listings#edit", as: "listing_edit"
  patch '/listings/:id' => "listings#update", as: "listing_update"
  delete 'listings/:id' => "listings#destroy", as: "listing_delete"

  get 'tags/:tag', to: 'listings#index', as: :tag 

  resources :listings do
  resources :reservations, only: [:new, :create]
  end

  resources :reservations, except: [:new, :create]

  root 'welcome#home'

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
