Rails.application.routes.draw do
  resources :ai_models
  devise_for :users

  root to: 'index#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
