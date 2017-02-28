Rails.application.routes.draw do

  resources :topics do
    #       # resources :bookmarks do
    resources :bookmarks, except: [:index]
  end

  devise_for :users, controllers: { registrations: 'registrations' }


  get 'welcome/about'
  # get 'about' => 'welcome#about'

  get 'welcome/index'
  # get 'topics' => 'welcome#topics'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
