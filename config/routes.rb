Vigitox::Application.routes.draw do
  get "home/index"
  match "/mentionslegales" => "home#disclaimer", as: "disclaimer"

  devise_for :users

  as :user do
    get "/login", :to => "devise/sessions#new"
    get "/logout", :to=> "devise/sessions#destroy"
  end

  # ressources de nom féminin
  scope path_names: {new: "nouvelle", edit: "modifier"} do
    resources :categories
    resources :revues do
      get :archive, :on => :collection
      post :sort_articles, :on => :collection
      resources :articles, path_names: {new: "nouveau", edit: "modifier"}
    end
  end

  # ressources de nom masculin commençant par voyelle
  scope path_names: {new: "nouveau", edit: "modifier"} do
    resources :authors, path: "auteurs" do
      get :names, :on => :collection
    end
    resources :arguments do
      get :names, :on => :collection
    end
    resource :articles, except: :index do
      get :autocomplete_author_nom, on: :collection
      get :autocomplete_argument_name, on: :collection
      get :search, on: :collection
    end
  end

  match "/search" => "articles#search"
  match "/archive" => "revues#archive"


  root :to => 'home#index'
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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
