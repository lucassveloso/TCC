require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  before(:each) do
    sign_in
  end

  describe '#index' do
    before :each do
      @teacher_db1 =  Teacher.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), registration_number: 123)
      @teacher_db2 =  Teacher.create(id:2, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), registration_number: 456)
    end

    it 'is expected that @teachers to be a list with all teachers registered' do
        get :index
        expect(assigns('teachers')).to match_array([@teacher_db1,@teacher_db2])
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
      @teacher_db =  Teacher.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), registration_number: 123)
    end

    context 'when parameter ID is valid' do
      it 'get teacher with that id' do
        get :show, id: 1
        expect(assigns('teacher')).to eq(@teacher_db)
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
    it 'is expected that @teacher to be a instance of Teacher' do
        get :new
        expect(assigns('teacher')).to be_a_new(Teacher)
    end
  end

  describe '#create' do
    context 'when parameters are valid and saving with success' do
      it 'redirect to teacher created' do
        post :create, { teacher: { registration_number: 123,
                                   person_attributes: {name: "Lucas", genre:"Male", birthdate: "22/08/1995"}
                                 }
                      }
        teacher_created_id = Teacher.last.id
        expect(response).to redirect_to("/teachers/#{teacher_created_id}")
      end

      it 'show a success message' do
        post :create, { teacher: { registration_number: 123,
                                  person_attributes: {name: "Lucas", genre:"Male", birthdate: "22/08/1995"}
                                 }
                      }
        expect(flash[:notice]).to eq("Professor cadastrado com sucesso")
      end
    end

    context 'when parameters are not valid and something goes wrong when saving' do
      it 'render new again' do
        post :create, teacher: { registration_number: 123 }
        expect(response).to render_template("new")
      end
    end
  end

  describe '#update' do
    before :each do
      @teacher_db =  Teacher.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), registration_number: 123)
    end

    context 'when update was a success' do
      it 'redirect to teacher updated' do
        put :update, { id: @teacher_db.id, teacher: {  registration_number: 123 } }
        expect(response).to redirect_to(@teacher_db)
      end

      it 'show a success message' do
        put :update, { id: @teacher_db.id, teacher: {  registration_number: 123 } }
        expect(flash[:notice]).to eq("Alterações realizadas com sucesso")
      end
    end

    context 'when parameters are not valid and something goes wrong when updating' do
      it 'render edit again' do
        put :update, { id: @teacher_db.id, teacher: {
                                             person_attributes: {name: nil, genre: nil, birthdate: nil}
                                           }
                      }
        expect(response).to render_template("edit")
      end
    end
  end

  describe '#destroy' do
    before :each do
      @teacher_db =  Teacher.create(id:1, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"), registration_number: 123)
    end

    context 'when teacher was destroyed' do
      it 'show a success message' do
        delete :destroy, id: @teacher_db.id
        expect(flash[:notice]).to eq("O Professor #{@teacher_db.person.name} foi removido com sucesso")
      end
    end
  end

  describe '#search_teachers' do
    before :each do
      @teacher_db =  Teacher.create(id:1, registration_number: 123, person: Person.new(name:"Lucas", genre:"Male", birthdate: "1996-06-16"))
    end

    context 'when request is in format XHR' do
      context 'parameter text_search matches the name of a teacher' do
        it 'is expect that response to be json with these teachers' do
          xhr :get, :search_teachers, text_search: 'Lucas'
          expect(response.body).to eq('['+@teacher_db.to_json({:include => [:person]})+']')
        end
      end

      context 'parameter text_search matches the registration_number of a teacher' do
        it 'is expect that response to be json with these teachers' do
          xhr :get, :search_teachers, text_search: '123'
          expect(response.body).to eq('['+@teacher_db.to_json({:include => [:person]})+']')
        end
      end

      context 'parameter text_search dont matches the name and registration_number of a teacher' do
        it 'is expect that response to be json empty' do
          xhr :get, :search_teachers, text_search: 'João'
          expect(response.body).to eq("[]")
        end
      end
    end
  end
end
