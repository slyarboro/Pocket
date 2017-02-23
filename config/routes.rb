Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
    # resources :bookmarks, only: [:index, :create, :show, :update, :destroy]
    # resources :tags, only: [:create, :update]
  end

  devise_for :users

  get 'welcome/about'
  # get 'about' => 'welcome#about'

  get 'welcome/index'
  # get 'topics' => 'welcome#topics'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
