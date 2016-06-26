class SchoolClass < ActiveRecord::Base
  has_many :students
  has_and_belongs_to_many :teachers
  validates :number, presence: true
  validates :grade, presence: true

  include PgSearch
  pg_search_scope :search, against: [:number, :grade], ignoring: :accents,
  using: {tsearch: {prefix: true, dictionary: "simple"}}
end
