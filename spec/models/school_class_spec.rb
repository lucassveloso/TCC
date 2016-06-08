require 'rails_helper'

describe SchoolClass, type: :model do
  describe 'validation' do
    before :each do
      @school_class = SchoolClass.new(number: 123, classroom: "room 10", grade: "5º ano")
    end

    it "should require a class's number" do
      @school_class.number = nil
      expect(@school_class).to_not be_valid
    end

    it 'should require a grade' do
      @school_class.grade = nil
      expect(@school_class).to_not be_valid
    end
  end
end
