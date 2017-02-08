Rails.application.routes.draw do
  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  resources :topics do
    resources :bookmarks, except: [:index]
    # resources :bookmarks, only: [:index, :create, :show, :update, :destroy]
    # resources :tags, only: [:create, :update]
  end

  devise_for :users

  # resources :users, only: [:new, :create]
  # resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :create]
  resources :sessions, only: [:new, :create]


  post 'users/confirm' => 'users#confirm'

  get 'welcome/about'
  # get 'about' => 'welcome#about'

  get 'welcome/index'
  # get 'topics' => 'welcome#topics'

  root 'welcome#index'

  # match 'bookmarks' => 'bookmarks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
