class Certificate < ActiveRecord::Base
  has_one :student
  validates :type_of, presence: true
  validates :term_number, presence: true
end
