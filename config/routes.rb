Rails.application.routes.draw do
  resources :ai_models
  devise_for :users

  root to: 'index#index'

  get 'people/', to: 'index#people'

  post 'users/tokens/generate_post/', to: 'authentication_tokens#generate'
  get  'users/tokens/generate/', to: 'authentication_tokens#generate_get', as: :generate_token
  get 'users/:id/models', to: 'ai_models#user_models', as: :user_models

  get '/discord', to: 'index#discord'

  post '/ai_models/create_auto', to: 'ai_models#create_auto'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
