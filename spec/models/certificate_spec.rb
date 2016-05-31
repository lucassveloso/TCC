require 'rails_helper'

describe Certificate, type: :model do
  describe 'validation' do
    before :each do
      @certificate = Certificate.new(person: Person.new, type_of:'birth', term_number: 123, sheet_number: 321, book: "A", emission_date: "01/01/2000", federation_unit: "RS",  notarys_office: "notary's office")
    end

    it 'should require a type of certificate' do
      @certificate.type_of = nil
      expect(@certificate).to_not be_valid
    end

    it 'should require a term number' do
      @certificate.term_number = nil
      expect(@certificate).to_not be_valid
    end

    it 'should require belonging to a person' do
      @certificate.person = nil
      expect(@certificate).to_not be_valid
    end
  end
end
