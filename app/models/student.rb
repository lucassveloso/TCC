class Student < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :certificate, dependent: :destroy
  belongs_to :identity_document, dependent: :destroy
  has_many :responsibles
  validates :person, presence: true
  validates :nis_number, presence: true
  validates :certificate, presence: true
  validates :identity_document, presence: true
  validates :cpf, presence: true

  include PgSearch
  pg_search_scope :search,  :against =>  [:nis_number],
                            :associated_against => { :person => [:name] },
                            :ignoring => :accents
end
