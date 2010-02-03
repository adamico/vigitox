ActionController::Routing::Routes.draw do |map|
  map.resources :categories

  map.resources :revues, :has_many => :articles, :shallow => true
  map.root :revues
end
