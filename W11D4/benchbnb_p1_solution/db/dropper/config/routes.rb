Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # write an individual route, you can create custom routes this way
  # get '/drops', to: 'drops#index'
  # post '/drops', to: 'drops#create' 
  # get '/drops/:id', to: 'drops#show' 
    # `:id` -> wildcard, used to find a particular piece of data based on the id provided
    # eg `/drops/1` -> drop with an id of 1
    # can name wildcards anything (eg `banana`) but we want to stick to conventions (`id`)

  # if following convention, we can use this shorthand:
  resources :users, only: [:new, :create]
  
  resource :session, only: [:new, :create, :destroy]
  # above we use SINGULAR 'resource'. this will mean we don't have any wildcards in our routes
  # this makes sense because a session can never have an 'id'
  
  namespace :api, defaults: { format: :json } do  
    resources :drops, only: [:index, :create, :show, :destroy, :update, :new, :edit]
    resources :users, only: [:index, :update]
  end 

  get '/set_cookie', to: 'drops#set_cookie'
  get '/get_cookie', to: 'drops#get_cookie'

  root to: 'static_pages#root'

end
