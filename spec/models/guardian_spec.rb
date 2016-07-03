require 'rails_helper'

describe Guardian, type: :model do
  describe 'validation' do
    before :each do
      @guardian = Guardian.new(person: Person.new)
    end

    it 'should require a person' do
      @guardian.person = nil
      expect(@guardian).to_not be_valid
    end

  end
end
