require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#show' do
    before :each do
      @student_db =  Student.create(id:10, person: Person.new(name:"Lucas", genre:"Male", birthdate: "22/08/1995"), school_class: SchoolClass.new(number:10, grade: "primary"))
    end

    context 'when parameter ID is valid' do
      it 'get student with that id' do
        get :show, id: 10
        expect(assigns('student')).to eq(@student_db)
      end
    end

    context 'when parameter ID is not valid' do
      it 'redirect to /404' do
        get :show, id: 1000
        expect(response).to redirect_to("/404")
      end
    end
  end

  describe '#new' do
    it 'is expected that @student to be a instance of Student' do
        get :new
        expect(assigns('student')).to be_a_new(Student)
    end
  end

  describe '#create' do
    before :each do
      SchoolClass.create(id:1 ,number:10, grade: "primary")
    end

    context 'when parameters are valid and saving with success' do
      it 'redirect to student created' do
        post :create, { student: { nis_number: 123,
                                   school_class_id: 1,
                                   person_attributes: {name: "Lucas", genre:"Male", birthdate: "22/08/1995"}
                                 }
                      }
        student_created_id = Student.last.id
        expect(response).to redirect_to("/students/#{student_created_id}")
      end
    end

    context 'when parameters are not valid and something goes wrong when saving' do
      it 'render new again' do
        post :create, student: { nis_number: 123, school_class_id: 1 }
        expect(response).to render_template("new")
      end
    end

  end
end
