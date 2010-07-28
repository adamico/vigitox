Vigitox::Application.routes.draw do |map|
  devise_for :users

  resources :authors, :arguments, :categories, :articles

  resources :revues, :shallow => true do
    resources :articles do
      post :sort, :on => :collection
    end
  end

  root :to => 'revues#index'
end
