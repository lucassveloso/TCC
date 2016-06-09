class Document < ActiveRecord::Base
  belongs_to :identity_document
  has_one :person
  has_many :certificates
  validates :identity_document, presence: true
end
