require 'rails_helper'

describe Address, type: :model do
  describe 'validation' do
    before :each do
      @address = Address.new(address:'xyz Street', zipcode:'00000-000', city:'City', state:'State', country:'Country', neighborhood: 'Neighborhood', complement: 'Complement', number: 123)
    end

    it 'should require an address' do
      @address.address = nil
      expect(@address).to_not be_valid
    end

    it 'should require a city' do
      @address.city = nil
      expect(@address).to_not be_valid
    end
  end
end
