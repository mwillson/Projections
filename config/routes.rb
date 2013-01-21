Projections::Application.routes.draw do

  get "users/new"
  get "projections/new"

  root to: 'pages#home'

  match '/about', to: 'pages#about'
  match '/help', to: 'pages#help'
  match '/feedback', to: 'pages#feedback'
  match '/contact', to: 'pages#contact'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  resources :users
  resources :projections
  resources :sessions, only: [:new, :create, :destroy]
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
#== Route Map
# Generated on 20 Jan 2013 13:50
#
# projections_new GET    /projections/new(.:format)      projections#new
#            root        /                               pages#home
#           about        /about(.:format)                pages#about
#            help        /help(.:format)                 pages#help
#        feedback        /feedback(.:format)             pages#feedback
#         contact        /contact(.:format)              pages#contact
#          signup        /signup(.:format)               users#new
#          signin        /signin(.:format)               sessions#new
#         signout DELETE /signout(.:format)              sessions#destroy
#           users GET    /users(.:format)                users#index
#                 POST   /users(.:format)                users#create
#        new_user GET    /users/new(.:format)            users#new
#       edit_user GET    /users/:id/edit(.:format)       users#edit
#            user GET    /users/:id(.:format)            users#show
#                 PUT    /users/:id(.:format)            users#update
#                 DELETE /users/:id(.:format)            users#destroy
#     projections GET    /projections(.:format)          projections#index
#                 POST   /projections(.:format)          projections#create
#  new_projection GET    /projections/new(.:format)      projections#new
# edit_projection GET    /projections/:id/edit(.:format) projections#edit
#      projection GET    /projections/:id(.:format)      projections#show
#                 PUT    /projections/:id(.:format)      projections#update
#                 DELETE /projections/:id(.:format)      projections#destroy
#        sessions POST   /sessions(.:format)             sessions#create
#     new_session GET    /sessions/new(.:format)         sessions#new
#         session DELETE /sessions/:id(.:format)         sessions#destroy
