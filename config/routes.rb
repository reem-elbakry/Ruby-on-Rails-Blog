Rails.application.routes.draw do
  devise_for :users
  resources :users
  # get 'articles/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show", as: "article"

  # resources :articles  #generate all routes for articles
 
  # Defines the root path route ("/")  >> override the main page
  root "articles#index"

  resources :articles do
    resources :comments   #nested resources >> /article/1/comment
  end
end
