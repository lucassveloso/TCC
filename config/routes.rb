Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :teachers
  resources :groups
  resources :responsibles
end
