Rails.application.routes.draw do

  get 'transactions/crecreate'

  get 'transactions/destroy'

  devise_for :shops, :controllers => { :registrations => "shops/registrations", :sessions => "shops/sessions" }
  devise_for :students, :controllers => { :registrations => "students/registrations" }

  resources :shops, :only => [:show, :index]
  resources :transactions, :only => [:show, :index]

  root 'static_pages#landing'

  get 'shops' => 'shops#index'
  get 'views' => 'static_pages#shop_views'
  get 'user/transactions' => 'static_pages#transactions'
  get 'shops/available/show' => 'shops#available'
  get 'students/available/show' => 'students#available'

  # Since transactions backend is still not done, these routes are just for show.
  get 'shops/:id/transactions/:transaction_id/edit' => 'transactions#edit', as: :edit_transaction

  # File upload / download
  match 'shops/:id/transactions/create' => 'transactions#create', :as => :create_transaction, :via => :post
  get 'shops/:shop_id/transactions/:id/download' => 'transactions#download', :as => :download
  get 'errors/missing_file'

  # Transaction editing
  post 'shops/:shop_id/transactions/:id/printed' => 'transactions#printed', :as => :printed
  post 'shops/:shop_id/transactions/:id/paid' => 'transactions#paid', :as => :paid

  match 'shops/:s_id/transactions/:t_id/destroy' => 'transactions#destroy', :as => :destroy_transaction, :via => :get

  # Toggle availability
  match 'shops/available' => 'shops#toggle_availability', :as => :toggle_availability, :via => :post

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
