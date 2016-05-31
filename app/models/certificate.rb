class Certificate < ActiveRecord::Base
  belongs_to :person
  validates :person, presence: true
  validates :type_of, presence: true
  validates :term_number, presence: true
end
