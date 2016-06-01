Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :teacher
  resources :group
end
