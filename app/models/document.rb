class Document < ActiveRecord::Base
  belongs_to :identity_document
  has_one :person
  has_many :certificates
  accepts_nested_attributes_for :identity_document, :certificates
end
