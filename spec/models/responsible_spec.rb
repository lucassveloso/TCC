require 'rails_helper'

describe Responsible, type: :model do
  describe 'validation' do
    before :each do
      @responsible = Responsible.new(person: Person.new, kinship: "Mother", students: [Student.new])
    end

    it 'should require a person' do
      @responsible.person = nil
      expect(@responsible).to_not be_valid
    end

    it 'should require a kinship' do
      @responsible.kinship = nil
      expect(@responsible).to_not be_valid
    end

    it 'should require students' do
      @responsible.students = []
      expect(@responsible).to_not be_valid
    end

  end
end
