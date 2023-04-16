Rails.application.routes.draw do
  resources :ai_models
  devise_for :users

  root to: 'index#index'

  get 'people/', to: 'index#people'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
