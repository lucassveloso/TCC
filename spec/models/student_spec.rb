require 'rails_helper'

describe Student, type: :model do
  describe 'validation' do
    before :each do
      @student = Student.new(person: Person.new, nis_number: 123, entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com", school_class: SchoolClass.new)
    end

    it 'should require a person' do
      @student.person = nil
      expect(@student).to_not be_valid
    end

    it 'should require a school class' do
      @student.school_class = nil
      expect(@student).to_not be_valid
    end

    it 'should require a Nis number if student has the Bolsa Familia (social program)' do
      @student.nis_number = nil
      @student.bolsa_familia = true
      expect(@student).to_not be_valid
    end
  end
end
