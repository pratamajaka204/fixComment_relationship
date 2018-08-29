Rails.application.routes.draw do
  # get 'comments/index'

  # get 'comments/new'

  # get 'comments/edit'

  # get 'articles/index'

  # get 'articles/edit'
  
  # post 'articles/new'

  # get 'articles/show'

  post 'articles/asd'

  # ROUTE STANDARD

  # get 'articles/edit', to: "articles#edit", as: :articles
  # ------------------------------------------------------

  # RESTFULL ROUTE
  root :to => "articles#index" 
  resources :articles

  resources :comments
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
