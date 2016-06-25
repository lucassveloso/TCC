require 'rails_helper'

describe Student, type: :model do
  describe 'validation' do
    before :each do
      @student = Student.new(person: Person.new, nis_number: 123)
    end

    it 'should require a person' do
      @student.person = nil
      expect(@student).to_not be_valid
    end

    it 'should require a Nis number if student has the Bolsa Familia (social program)' do
      @student.nis_number = nil
      @student.bolsa_familia = true
      expect(@student).to_not be_valid
    end
  end
end
