require 'rails_helper'

describe Teacher, type: :model do
  describe 'validation' do
    before :each do
      @teacher = Teacher.new(person: Person.new, registration_number: 123)
    end

    it 'should require a person' do
      @teacher.person = nil
      expect(@teacher).to_not be_valid
    end

    it 'should require a registration number' do
      @teacher.registration_number = nil
      expect(@teacher).to_not be_valid
    end
  end
end
