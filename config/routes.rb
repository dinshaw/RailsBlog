ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  map.resources :users, :member => { :suspend   => :put, :unsuspend => :put, :purge => :delete }

  map.resources :posts, :has_many => :comments

  map.resources :tags

  map.namespace :admin do |admin|
    admin.resources :posts do |post|
      post.resources :comments, :tags
      post.resources :post_resources, :member => { :up => :get }
    end
  end

  map.root :controller => "posts"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
