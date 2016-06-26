Rails.application.routes.draw do
  root 'home#index'
  resources :students, :teachers, :responsibles
  resources :school_classes do
    get :show_teachers
    get :show_students
  end
  get "students_search" => "students#search_students"
  get "teachers_search" => "teachers#search_teachers"
end
