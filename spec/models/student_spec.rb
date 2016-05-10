require 'rails_helper'

describe Student, type: :model do
  describe 'validation' do
    before :each do
      @student = Student.new(person_id: 1, nis_number: 123, certificate_id: 1, identity_document_id: 1, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
    end

    it 'should require a person' do
      @student.person_id = nil
      expect(@student).to_not be_valid
    end

    it 'should require a nis number' do
      @student.nis_number = nil
      expect(@student).to_not be_valid
    end

    it 'should require a certificate' do
      @student.certificate_id = nil
      expect(@student).to_not be_valid
    end

    it 'should require a identity document' do
      @student.identity_document_id = nil
      expect(@student).to_not be_valid
    end

    it 'should require a cpf' do
      @student.cpf = nil
      expect(@student).to_not be_valid
    end

  end
end
