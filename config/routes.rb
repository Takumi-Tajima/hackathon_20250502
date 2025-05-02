Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  root 'meal_kets#index'

  resources :meal_kets, only: %i[index show]

  namespace :users do
    resources :addresses, only: %i[index new create edit update destroy]
    resources :delivery_plans, only: %i[index show]
    resources :user_plans, only: %i[index new create destroy]
  end

  namespace :admins do
    root 'meal_kets#index'
    resources :meal_kets, only: %i[index show new create edit update destroy]
    resources :delivery_plans, only: %i[index show new create edit update destroy]
  end
end
