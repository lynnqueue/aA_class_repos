# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                      root GET  /                                                                                        static_pages#root
#         api_pokemon_index GET  /api/pokemon(.:format)                                                                   api/pokemon#index {:format=>:json}
#                           POST /api/pokemon(.:format)                                                                   api/pokemon#create {:format=>:json}
#               api_pokemon GET  /api/pokemon/:id(.:format)                                                               api/pokemon#show {:format=>:json}

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#root'
  namespace :api, defaults: {format: :json} do
    resources :pokemon, only: [:create, :index, :show]
  end
end
