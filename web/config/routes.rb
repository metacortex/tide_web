Web::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => :logout
  get "login" => "sessions#new", :as => :login
  post "login" => "sessions#create"
  resources :password_resets

  match "oauth/callback" => "oauths#callback"
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  get "signup" => "users#new", :as => :signup
  get "welcome" => "main#welcome", :as => :welcome

  resources :users do
    collection do
      get 'search'
      get 'all'
      get 'edit_profile'
      put 'update_profile'
      get 'invite'
      get 'edit_connections'
      put 'update_connections'
      get 'edit_password'
      put 'update_password'
    end
    resources :connections
  end


  resources :posts do
  end
  resources :events do
    resources :registrations
  end
  resources :boards

  resources :comments
  resources :agreements
  resources :invitations
  
  get "/archives(/:action)", :controller => "archives", :action => "index"


  #
  #
  namespace :admin do
    match '/' => redirect("/admin/events")
    resources :users
    resources :events
    resources :categories
    resources :posts
    resources :videos
    resources :assets
    resources :banners
  end



  match 'editing(/:action(/:id))', :controller => "editing", :action => "index"
  
  match '/tide' => "main#index"
  root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
