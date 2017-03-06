Rails.application.routes.draw do

  get 'likes/index'

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
      resources :likes, only: [:index, :create, :destroy]
  end

  get 'welcome/about'
  # get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
