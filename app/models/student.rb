class Student < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :school_class
  has_and_belongs_to_many :guardians
  has_and_belongs_to_many :authorizations
  has_and_belongs_to_many :additional_activities
  validates :person, presence: true
  validates :nis_number, presence: true, if: :bolsa_familia?

  accepts_nested_attributes_for :person

  include PgSearch
  pg_search_scope :search, against: [:nis_number], ignoring: :accents,
  associated_against: {
       person: [:name]
     },
  using: {tsearch: {prefix: true, dictionary: "simple"}}
end
