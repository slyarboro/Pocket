Rails.application.routes.draw do
  resources :posts
  resources :pages
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  # get '/pages', to: 'pages#index'
  ### above: to: 'pages# = to: pages_controller
  ### above: # = instance methods of a class
  ### above: #index' = name of action method want to call
  ### PE: get request for /pages path go to pages_controller's index method

  # post '/pages', to: 'pages#create'
  # get '/pages/new', to: 'pages#new', as: 'new_page'
  # get '/pages/:id', to: 'pages#show', as: 'page'
  # get '/pages/:id/edit', to: 'pages#edit', as: 'edit_page'
  # patch '/pages/:id', to: 'pages#update'
  # delete '/pages/:id', to: 'pages#destroy'

  ## all page routes can be replaced with single resources: pages
  ## all post routes can be replaced with single resources: posts, etc

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
