Rails.application.routes.draw do
  root 'home#index'

  resources :students do
    get :show_guardians
  end
  resources :guardians do
    get :show_students
  end
  resources :teachers do
    get :show_school_classes
  end
  resources :school_classes do
    get :show_teachers
    get :show_students
  end

  get "students_search" => "students#search_students"
  get "teachers_search" => "teachers#search_teachers"
  get "school_classes_search" => "school_classes#search_school_classes"
  get "guardians_search" => "guardians#search_guardians"

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
end
