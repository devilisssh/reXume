Rails.application.routes.draw do
  root to: 'search#new'
  get 'search/results'
  devise_for :users
  resources :users
  resources :resumes
end
