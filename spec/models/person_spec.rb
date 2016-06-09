require 'rails_helper'

describe Person, type: :model do
  describe 'validation' do
    before :each do
      @person = Person.new(name: "Lucas", genre: "Male", birthdate: "22/08/1995")
    end

    it 'should require a name' do
      @person.name = nil
      expect(@person).to_not be_valid
    end

    it 'should require a genre' do
      @person.genre = nil
      expect(@person).to_not be_valid
    end

    it 'should require a birthdate' do
      @person.birthdate = nil
      expect(@person).to_not be_valid
    end

  end
end
