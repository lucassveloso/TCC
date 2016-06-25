Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :teachers
  resources :school_classes
  resources :responsibles
  get "autocomplete/school_classes/students" => "school_classes#search_students"
end
