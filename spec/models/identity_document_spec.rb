require 'rails_helper'

describe IdentityDocument, type: :model do
  describe 'validation' do
    before :each do
      @identity_document = IdentityDocument.new(identity_number: 123, dispatch_date: "01/01/2000", federation_unit: "RS",  dispatcher_organ: "SSP")
    end

    it 'should require a identity number' do
      @identity_document.identity_number = nil
      expect(@identity_document).to_not be_valid
    end

  end
end
