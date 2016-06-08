require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#show' do
    before :each do
      @student_db = Student.create(id:10, person: Person.new(name:"Lucas", genre:"Male", birthdate: "22/08/1995"), school_class: SchoolClass.new)
    end

    it 'is expected that global variable @student be the student with id passed by params' do
      get :show, id: 10
      expect(assigns(:student)).to eq(@student_db)
    end

    it 'is expected to be redirect to /404 when passing a student that doesnt exists' do
      get :show, id: 1000
      expect(response).to redirect_to("/404")
    end
  end
end
