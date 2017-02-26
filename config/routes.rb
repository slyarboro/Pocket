Rails.application.routes.draw do

  get 'bookmarks/show'
  get 'bookmarks/new'
  get 'bookmarks/edit'
  get 'topics/index'
  get 'topics/show'
  get 'topics/new'
  get 'topics/edit'

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'

    resources :topics do
      # resources :bookmarks do
      resources :bookmarks, except: [:index]
    #   # resources :bookmarks, only: [:index, :create, :show, :update, :destroy]
    #   # resources :tags, only: [:create, :update]
    # end
  end
  #
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end






#
#
#
# Rails.application.routes.draw do
#
#   get 'users/show'
#
#   devise_for :users
#
#   get 'bookmarks/show'
#
#
#   resources :topics do
#     resources :bookmarks, except: :index
#   end
#
#   resources :bookmarks, except: [:index] do
#     # resources :bookmarks, only: [:index, :create, :show, :update, :destroy]
#     # resources :tags, only: [:create, :update]
#   end
#
#   resources :users, only: [:show]
#
#
#
#   # devise_for :users
#
#   get 'welcome/about'
#   # get 'about' => 'welcome#about'
#
#   get 'welcome/index'
#   # get 'topics' => 'welcome#topics'
#
#   root 'welcome#index'
#
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
