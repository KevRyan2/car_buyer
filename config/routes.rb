Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    # namespace :v1 do 
      resources :vehicles, :users
        get "/vehicles",          to: "vehicles#index"
        post "/vehicles",         to: "vehicles#create"
        post "/users",            to: "users#create"

        get "/vehicles/:id",      to: "vehicles#show"
        put "/vehicles/:id",      to: "vehicles#update" 
        put "/users/:id",         to: "users#update"
        delete "/vehicles/:id",   to: "vehicles#destroy"
        delete "/users/:id",      to: "users#destroy"
    # end    
  end
  


  resources :vehicles
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'vehicles#index'



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'



  # resources "vehicles" do
  #   get 'api/vehicles' => 'api_vehicles#index'
  #   put 'api/vehicles' =>'api_vehicles#update'
  #   post 'api/vehicles' =>'api_vehicles#new'
  #   delete 'api/vehicles' =>'api_vehicles#destroy'
  # end





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
