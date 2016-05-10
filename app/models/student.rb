class Student < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :certificate, dependent: :destroy
  belongs_to :identify_document, dependent: :destroy
  has_many :responsibles
end
