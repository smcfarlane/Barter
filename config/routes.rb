Rails.application.routes.draw do

  resources :boards
  resources :agreements, except: [:show]
  resources :message, only: [:new, :create, :destroy]

  authenticated :user do
    root :to => 'profile#index', as: :authenticated_root
  end
  root :to => 'welcome#index'
  get 'profile' => 'profile#index'

  post '/skill/add_skill_to_user' => 'skills#add_skill_to_user'
  post '/skill/kill_destroy' => 'skills#kill_destroy'
  delete '/skill/kill_destroy' => 'skills#kill_destroy'
  delete '/admin/destroy_user' => 'admin#destroy_user'
 
  post '/skill/create_skill' => 'skills#create_skill'

  # get '/skill/delete_skill_from_user' => 'skills#delete_skill_from_user'

  devise_for :users, controllers: { registrations: "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  scope :user do
    resources :skills do
      get 'delete'
    end
  end

  get 'kill' => 'skills#kill'
  get 'create_new_skill' => 'skills#create_new_skill'

  match ':controller(/:action(/:id))', :via => :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
