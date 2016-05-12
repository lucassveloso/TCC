require 'rails_helper'

describe Student, type: :model do
  describe 'validation' do
    before :each do
      @student = Student.new(person: Person.new, nis_number: 123, certificate: Certificate.new, identity_document: IdentityDocument.new, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
    end

    it 'should require a person' do
      @student.person = nil
      expect(@student).to_not be_valid
    end

    it 'should require a nis number' do
      @student.nis_number = nil
      expect(@student).to_not be_valid
    end
  end
end
