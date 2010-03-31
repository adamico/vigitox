ActionController::Routing::Routes.draw do |map|
  map.resources :arguments, :categories

  map.resources :revues, :has_many => :articles, :shallow => true
  map.root :revues
end
