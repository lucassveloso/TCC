Rails.application.routes.draw do
  root 'home#index'
  resources :students, :responsibles
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
end
