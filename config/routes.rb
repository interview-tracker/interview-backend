Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions"}
  
  # resources :interviews, only: [:index, :show, :edit]
  # resources :listings
  # resources :resumes

  # ROUTES FOR INTERVIEWS
  post 'users/listings/:lid/interviews', to: 'interviews#create'
  patch 'users/interviews/:iid', to: 'interviews#edit'
  get 'users/interviews', to: 'interviews#index'
  get 'users/interviews/:iid', to: 'interviews#show'
  delete 'users/interviews/:iid', to: 'interviews#destroy'

  # ROUTES FOR LISTINGS
  post 'users/listings', to: 'listings#create'
  patch 'users/listings/:lid', to: 'listings#edit'
  get 'users/listings', to: 'listings#index'
  get 'users/listings/:lid', to: 'listings#show'
  delete 'users/listings/:lid', to: 'listings#destroy'

  # ROUTES FOR RESUMES
  post 'users/resumes', to: 'resumes#create'
  get 'users/resumes', to: 'resumes#index'
  get 'users/resumes/:rid', to: 'resumes#show'
  delete 'users/resumes/:rid', to: 'resumes#destroy'

  # ADD LONE ROUTE FOR USERS :(
  get '/user', to: 'users#show'
  patch '/user', to: 'users#edit'

  #get ':username', to: 'users#show', as: :user
  
  get '/games/:id', to: 'game#show'
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
