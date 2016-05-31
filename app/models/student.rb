class Student < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :group
  has_and_belongs_to_many :responsibles
  validates :person, presence: true
  validates :nis_number, presence: true
  validates :group, presence: true

  include PgSearch
  pg_search_scope :search,  :against =>  [:nis_number],
                            :associated_against => { :person => [:name] },
                            :ignoring => :accents
end
