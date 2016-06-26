require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#index' do
    before :each do
      @student_db1 =  Student.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
      @student_db2 =  Student.create(id:2, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
    end

    it 'is expected that @students to be a list with all students registered' do
        get :index
        expect(assigns('students')).to match_array([@student_db1,@student_db2])
    end

    context 'when request is in format JSON' do
      it 'is expected to be successfully response' do
        get :index, {format: :json}
        expect(response).to be_success
      end
    end
  end

  describe '#show' do
    before :each do
      @student_db =  Student.create(id:10, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
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
    context 'when parameters are valid and saving with success' do
      it 'redirect to student created' do
        post :create, { student: { nis_number: 123,
                                   person_attributes: {name: "Lucas", genre:"Male", birthdate: "22/08/1995"}
                                 }
                      }
        student_created_id = Student.last.id
        expect(response).to redirect_to("/students/#{student_created_id}")
      end

      it 'show a success message' do
        post :create, { student: { nis_number: 123,
                                  person_attributes: {name: "Lucas", genre:"Male", birthdate: "22/08/1995"}
                                 }
                      }
        expect(flash[:notice]).to eq("Aluno cadastrado com sucesso")
      end
    end

    context 'when parameters are not valid and something goes wrong when saving' do
      it 'render new again' do
        post :create, student: { nis_number: 123 }
        expect(response).to render_template("new")
      end
    end
  end

  describe '#update' do
    before :each do
      @student_db =  Student.create(id:10, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
    end

    context 'when update was a success' do
      it 'redirect to student updated' do
        put :update, { id: @student_db.id, student: {  nis_number: 123 } }
        expect(response).to redirect_to(@student_db)
      end

      it 'show a success message' do
        put :update, { id: @student_db.id, student: {  nis_number: 123 } }
        expect(flash[:notice]).to eq("Alterações realizadas com sucesso")
      end
    end

    context 'when parameters are not valid and something goes wrong when updating' do
      it 'render edit again' do
        put :update, { id: @student_db.id, student: {
                                             person_attributes: {name: nil, genre: nil, birthdate: nil}
                                           }
                      }
        expect(response).to render_template("edit")
      end
    end
  end

  describe '#destroy' do
    before :each do
      @student_db =  Student.create(id:10, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
    end

    context 'when student was destroyed' do
      it 'show a success message' do
        delete :destroy, id: @student_db.id
        expect(flash[:notice]).to eq("O Aluno #{@student_db.person.name} foi removido com sucesso")
      end
    end
  end
end
