Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  root 'meal_kets#index'

  resources :meal_kets, only: %i[index show]

  namespace :admins do
    root 'meal_kets#index'
    resources :meal_kets, only: %i[index show new create edit update destroy]
  end
end
