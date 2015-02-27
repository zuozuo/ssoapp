Rails.application.routes.draw do

  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :users do
        get 'me', on: :collection
      end

      get '/me' => "credentials#me"
    end
  end

  resources :phones do
    collection do
      get 'verify'
      post 'verify'
      post 'create_code'
      post 'submit_code'
    end
  end

  resources :addresses

  resources :stores

  resources :solutionists

  resources :workers

  resources :customers

  resources :orders

  resources :finances


  get 'main/index'

  devise_for :users, :controllers => {registrations: "registrations"}

  resources :users do
    get :search, on: :collection
  end

  root 'users#index'

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get 'sign_up', to: "registrations#new"
    get 'sign_out', to: "devise/sessions#destroy"
  end

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
