class Document < ActiveRecord::Base
  belongs_to :identity_document, dependent: :destroy
  belongs_to :certificate, dependent: :destroy
  has_one :person
  accepts_nested_attributes_for :identity_document, :certificate
end
