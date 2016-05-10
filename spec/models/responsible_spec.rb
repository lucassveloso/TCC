require 'rails_helper'

describe Responsible, type: :model do
  describe 'validation' do
    before :each do
      @responsible = Responsible.new(person_id: 1, kinship: "Mother", student_id: 1)
    end

    it 'should require a person' do
      @responsible.person_id = nil
      expect(@responsible).to_not be_valid
    end

    it 'should require a kinship' do
      @responsible.kinship = nil
      expect(@responsible).to_not be_valid
    end

    it 'should require a student' do
      @responsible.student_id = nil
      expect(@responsible).to_not be_valid
    end

  end
end
