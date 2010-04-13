ActionController::Routing::Routes.draw do |map|
  map.resources :arguments, :categories

  map.resources :revues, :shallow => true do |revues|
    revues.resources :articles, :collection => { :sort => :post }
  end

  map.root :revues
end
