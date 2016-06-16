class Document < ActiveRecord::Base
  belongs_to :identity_document
  belongs_to :certificate
  has_one :person
  accepts_nested_attributes_for :identity_document, :certificate
end
