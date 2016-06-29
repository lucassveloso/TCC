require 'rails_helper'

describe Guardian, type: :model do
  describe 'validation' do
    before :each do
      @guardian = Guardian.new(person: Person.new, kinship: "Mother", students: [Student.new])
    end

    it 'should require a person' do
      @guardian.person = nil
      expect(@guardian).to_not be_valid
    end

    it 'should require a kinship' do
      @guardian.kinship = nil
      expect(@guardian).to_not be_valid
    end

    it 'should require students' do
      @guardian.students = []
      expect(@guardian).to_not be_valid
    end

  end
end
