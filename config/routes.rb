Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
