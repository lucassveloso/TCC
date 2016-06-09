require 'rails_helper'

describe Document, type: :model do
  describe 'validation' do
    before :each do
      @document = Document.new(identity_document: IdentityDocument.new, cpf: "123456789")
    end

    it 'should require a identity document' do
      @document.identity_document = nil
      expect(@document).to_not be_valid
    end
  end
end
