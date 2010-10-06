ActionController::Routing::Routes.draw do |map|

  map.devise_for :users

  map.resources :authors, :collection => { :names => :get }
  map.resources :arguments, :collection => { :names => :get }
  map.resources :categories

  map.search '/search', :controller => 'articles', :action => 'search'

  map.resources :revues, :shallow => true do |revues|
    revues.resources :articles
    revues.resources :articles, :collection => {
      :sort => :post
    }
  end

  map.root :revues
end
