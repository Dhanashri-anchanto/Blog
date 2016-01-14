
Blog1::Application.routes.draw do
  get "user/show"
  get "user/about"
  get "user/contact"
  get "user/help"
 
  get "home/index"

  get "errors/not_found"

  get "errors/internal_server_error"

  resources :tags

# get "signout" => "sessions#destroy", :as => :destroy_user_session
# get "signin" => "sessions#new", :as => :destroy_user_session
# get "signup" => "users#new", :as => :destroy_user_session

#resources :users
#resources :sessions
  #resources :categories
  #resources :posts
  
  devise_for :users #, :controllers => {:sessions => 'sessions'}

  root to: "home#index"
resources :posts

resources :categories do
  resources :posts do
     resources :comments
  end
end
#   devise_scope :user do
#    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end
get "/404" => "errors#not_found"
get "/500" => "errors#internal_server_error"




#match "/:slug" => "posts#show"
#match '/:permalink' => 'posts#show'


#match ':controller(/:action(/:id))', :via => [:get,:post]



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
