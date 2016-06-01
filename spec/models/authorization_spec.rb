require 'rails_helper'

describe Authorization, type: :model do
  describe 'validation' do
    before :each do
      @authorization = Authorization.new(description:"Authorization for Image Use")
    end

    it 'should require a description' do
      @authorization.description = nil
      expect(@authorization).to_not be_valid
    end
  end
end
