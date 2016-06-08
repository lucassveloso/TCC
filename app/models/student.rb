class Student < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :school_class
  has_and_belongs_to_many :responsibles
  has_and_belongs_to_many :authorizations
  has_and_belongs_to_many :additional_activities
  validates :person, presence: true
  validates :school_class, presence: true
  validates :nis_number, presence: true, if: :bolsa_familia?

  accepts_nested_attributes_for :person
end
