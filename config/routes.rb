Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :teachers
  resources :school_classes
  resources :responsibles
end
