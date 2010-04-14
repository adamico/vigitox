ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :arguments, :categories

  map.resources :revues, :shallow => true do |revues|
    revues.resources :articles, :collection => { :sort => :post }
  end

  map.root :revues
end
