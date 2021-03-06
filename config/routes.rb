Mgr1::Application.routes.draw do
  get "order_admin/index"
  get "order_admin/edycja"
  get "public/index"
  get "public/product"
  get "public/nowosci"
  get "public/category"
  get "public/order"
  get "orders/order"
  get "orders/index"
  get "orders/pokaz"
  get "orders/nowa"
  get "orders/edycja"
  get "orders/usun"
  get "categories/index"
  get "categories/pokaz"
  get "categories/nowa"
  get "categories/edycja"
  get "categories/usun"
  
  root  "public#index"

  get 'admin', :to => "dostep#index"
  #get "dostep/index"
  #get "dostep/login"
  #get "gallerys/index"
  #get "gallerys/pokaz"
  #get "gallerys/nowy"
  #get "gallerys/edycja"
  #get "gallerys/usun"
  #get "products/pokaz"
  #get "products/nowy"
  #get "products/edycja"
  #get "products/usun"

  match ':controller(/:action(/:id))', :via => [:get, :post]
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
