Rails.application.routes.draw do
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
  resources :tags do
    collection do
      get 'admin_index'
    end
  end
  resources :blogs do
    member do
      post 'update_publish'
    end
    collection do
      get 'admin_index'
    end
  end

  resources :resources, only: [:create, :new, :index, :destroy] do
    collection do
      post 'create_images'
    end
  end
  resources :home, only: :index
  get 'about' => 'home#about'
  get 'search' => 'home#search'

  namespace :admin do
    resources :session, only: :create
  end

  delete 'admin/clear_cache' => 'home#clear_cache'
  get 'admin/login' => 'admin/session#index'
  get 'admin/logout' => 'admin/session#destroy'


  root 'home#index'
end
