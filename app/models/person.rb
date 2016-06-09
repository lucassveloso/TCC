class Person < ActiveRecord::Base
  belongs_to :address, dependent: :destroy
  belongs_to :document, dependent: :destroy
  has_one :responsible
  has_one :student
  has_one :teacher
  validates :name, presence: true
  validates :genre, presence: true
  validates :birthdate, presence: true
end
