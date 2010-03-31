ActionController::Routing::Routes.draw do |map|
  map.resources :arguments

  map.resources :categories

  map.resources :tags, :categories
  map.resources :revues, :has_many => :articles, :shallow => true
  map.root :revues
end
