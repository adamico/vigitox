ActionController::Routing::Routes.draw do |map|
  map.resources :authors

  map.devise_for :users

  map.resources :arguments, :categories

  map.resources :revues, :shallow => true do |revues|
    revues.resources :articles
    revues.resources :articles, :collection => {
      :sort => :post
    }
  end

  map.root :revues
  map.connect ':controller/:action.:format'
end
