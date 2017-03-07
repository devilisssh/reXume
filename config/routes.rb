Rails.application.routes.draw do
  root to: 'search#new'
  get 'search/results'
  devise_for :users
  resources :users
  get '/resume', to: 'resumes#show'
  resources :resumes, except: [:index, :show]
end
