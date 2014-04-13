Wgtool::Application.routes.draw do
  
  resources :groups do
    resources :people
    resources :accountings
  end
  
  get 'people/assign', to: 'people#assign'

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match 'auth/:provider/callback', to: 'session#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'session#destroy', as: 'signout', via: [:get, :post]
end
