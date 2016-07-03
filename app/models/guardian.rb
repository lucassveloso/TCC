class Guardian < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  has_many :kinships
  has_many :students, through: :kinships
  validates :person, presence: true

  accepts_nested_attributes_for :person

  include PgSearch
  pg_search_scope :search, ignoring: :accents,
  associated_against: {
       person: [:name]
     },
  using: {tsearch: {prefix: true, dictionary: "simple"}}
end
