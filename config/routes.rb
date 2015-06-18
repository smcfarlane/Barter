Rails.application.routes.draw do

  resources :boards
  resources :agreements
  resources :message, except: [:index, :new, :edit]

  get 'user_info/new'

  get 'profile/index'

  authenticated :user do
    root 'skills#index', as: "authenticated_root"
  end

  get 'profile/edit'

  get 'profile/destroy'

  root 'welcome#index'

  post '/skill/add_skill_to_user' => 'skills#add_skill_to_user'

  # get '/skill/delete_skill_from_user' => 'skills#delete_skill_from_user'

  resources :services

  devise_for :users, controllers: { registrations: "registrations" }
  scope :user do
    resources :skills do
      get 'delete'
    end
  end
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
