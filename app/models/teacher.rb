class Teacher < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  has_and_belongs_to_many :school_classes
  validates :person, presence: true
  validates :registration_number, presence: true

  accepts_nested_attributes_for :person

  include PgSearch
  pg_search_scope :search, against: [:registration_number], ignoring: :accents,
  associated_against: {
       person: [:name]
     },
  using: {tsearch: {prefix: true, dictionary: "simple"}}
end
