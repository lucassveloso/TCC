class Student < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :group
  has_and_belongs_to_many :responsibles
  has_and_belongs_to_many :authorizations
  has_and_belongs_to_many :additional_activities
  validates :person, presence: true
  validates :group, presence: true
  validates :nis_number, presence: true, if: :bolsa_familia?

  include PgSearch
  pg_search_scope :search,  :against =>  [:nis_number],
                            :associated_against => { :person => [:name] },
                            :ignoring => :accents
end
