Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
  end

  get 'likes/index'

  get 'welcome/about'
  # get 'about' => 'welcome#about'

  root 'welcome#index'
end
