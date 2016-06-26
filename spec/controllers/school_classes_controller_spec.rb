require 'rails_helper'

RSpec.describe SchoolClassesController, type: :controller do
  describe '#index' do
    context 'when request is in format JSON' do
      it 'is expected to be successfully response' do
        get :index, {format: :json}
        expect(response).to be_success
      end
    end
  end

  describe '#show' do
    before :each do
      @school_class_db =  SchoolClass.create(id:10, number:100, grade: "1º Ano")
    end

    context 'when parameter ID is valid' do
      it 'get school class with that id' do
        get :show, id: 10
        expect(assigns('school_class')).to eq(@school_class_db)
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
    it 'is expected that @school_class to be a instance of SchoolClass' do
        get :new
        expect(assigns('school_class')).to be_a_new(SchoolClass)
    end
  end

  describe '#create' do
    context 'when parameters are valid and saving with success' do
      it 'redirect to school class created' do
        post :create, { school_class: { number:100, grade: "1º Ano" } }
        school_class_created_id = SchoolClass.last.id
        expect(response).to redirect_to("/school_classes/#{school_class_created_id}")
      end

      it 'show a success message' do
        post :create, { school_class: { number:100, grade: "1º Ano" } }
        expect(flash[:notice]).to eq("Turma cadastrada com sucesso")
      end
    end

    context 'when parameters are not valid and something goes wrong when saving' do
      it 'render new again' do
        post :create, { school_class: { number:nil, grade: nil } }
        expect(response).to render_template("new")
      end
    end

    context 'when parameters contains students_ids' do
      before :each do
        @student_db1 =  Student.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
        @student_db2 =  Student.create(id:2, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
      end
      it 'is expected to be added students to school_class' do
        post :create, { school_class: { number:100, grade: "1º Ano" }, students_ids: {'0': '1', '1': '2'} }
        expect(assigns('school_class').students).to match_array([@student_db1,@student_db2])
      end
    end
  end

  describe '#update' do
    before :each do
      @school_class_db =  SchoolClass.create(id:10, number:100, grade: "1º Ano")
    end

    context 'when update was a success' do
      it 'redirect to school class updated' do
        put :update, { id: @school_class_db.id, school_class: { number:123 } }
        expect(response).to redirect_to(@school_class_db)
      end

      it 'show a success message' do
        put :update, { id: @school_class_db.id, school_class: { number:123 } }
        expect(flash[:notice]).to eq("Alterações realizadas com sucesso")
      end
    end

    context 'when parameters are not valid and something goes wrong when updating' do
      it 'render edit again' do
        put :update, { id: @school_class_db.id, school_class: { number:nil } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe '#destroy' do
    before :each do
      @school_class_db =  SchoolClass.create(id:1, number:100, grade: "1º Ano")
      @student_db =  Student.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
    end

    context 'when school class hasnt students and teachers' do
      it 'show a success message if was destroyed' do
        delete :destroy, id: @school_class_db.id
        expect(flash[:notice]).to eq("A Turma #{@school_class_db.number} foi removida com sucesso")
      end
    end

    context 'when school class has students and/or teachers' do
      it 'show a error message' do
        @school_class_db.students.push(@student_db)
        delete :destroy, id: @school_class_db.id
        expect(flash[:error]).to eq("A Turma #{@school_class_db.number} não pode ser removida, existem alunos e/ou professores alocados")
      end
    end
  end

  describe '#search_students' do
    before :each do
      @student_db =  Student.create(id:1, nis_number: 123, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), school_class: SchoolClass.new(number:10, grade: "primary"))
    end

    context 'when request is in format XHR' do
      context 'parameter text_search matches the name of a student' do
        it 'is expect that response to be json with these students' do
          xhr :get, :search_students, text_search: 'Lucas'
          expect(response.body).to eq('['+@student_db.to_json({:include => [:person, :school_class]})+']')
        end
      end

      context 'parameter text_search matches the nis_number of a student' do
        it 'is expect that response to be json with these students' do
          xhr :get, :search_students, text_search: '123'
          expect(response.body).to eq('['+@student_db.to_json({:include => [:person, :school_class]})+']')
        end
      end

      context 'parameter text_search dont matches the name and nis_number of a student' do
        it 'is expect that response to be json empty' do
          xhr :get, :search_students, text_search: 'João'
          expect(response.body).to eq("[]")
        end
      end
    end
  end
end