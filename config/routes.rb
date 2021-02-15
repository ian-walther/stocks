Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/stocks', to: 'stocks#index'
  get '/show_price', to: 'stocks#show_price'

  root 'stocks#index'

end
