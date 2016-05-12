require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#search_students' do
    before :each do
      joao = Person.create(name:"João", genre: "Male", birthdate: "01/01/2000")
      maria = Person.create(name:"Maria", genre: "Female", birthdate: "01/01/2000")
      @student_joao = Student.create(person: joao, nis_number: 123, certificate: Certificate.new, identity_document: IdentityDocument.new, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
      @student_maria = Student.create(person: maria, nis_number: 456, certificate: Certificate.new, identity_document: IdentityDocument.new, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
    end

    it 'returns all students when text_search is nil' do
      get :index, text_search: nil
      expect(assigns(:search_results_students)).to match_array([@student_joao, @student_maria])
    end

    it 'returns all students when text_search is empty' do
      get :index, text_search: ''
      expect(assigns(:search_results_students)).to match_array([@student_joao, @student_maria])
    end

    it 'returns the student when text_search matches the name' do
      get :index, text_search: "Maria"
      expect(assigns(:search_results_students)).to match_array([@student_maria])
    end

    it 'returns the student when text_search matches the name ignoring accents' do
      get :index, text_search: "joao"
      expect(assigns(:search_results_students)).to match_array([@student_joao])
    end

    it 'returns the student when text_search matches the nis_number' do
      get :index, text_search: "123"
      expect(assigns(:search_results_students)).to match_array([@student_joao])
    end

     it 'returns menssage when text_search no matches any student' do
      get :index, text_search: "Lucas"
      expect(assigns(:search_results_students)).to eq("Sua pesquisa não encontrou resultados")
    end
  end
end
