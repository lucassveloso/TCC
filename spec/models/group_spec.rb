require 'rails_helper'

describe Group, type: :model do
  describe 'validation' do
    before :each do
      @group = Group.new(number: 123, classroom: "room 10", grade: "5º ano")
    end

    it "should require a class's number" do
      @group.number = nil
      expect(@group).to_not be_valid
    end

    it 'should require a grade' do
      @group.grade = nil
      expect(@group).to_not be_valid
    end
  end
end
