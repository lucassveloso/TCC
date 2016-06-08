class Person < ActiveRecord::Base
  belongs_to :address, dependent: :destroy
  belongs_to :identity_document, dependent: :destroy
  has_one :responsible
  has_one :student
  has_one :teacher
  has_many :certificates, dependent: :destroy
  validates :name, presence: true
  validates :genre, presence: true
  validates :birthdate, presence: true
end
