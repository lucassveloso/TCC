class Certificate < ActiveRecord::Base
  belongs_to :document
  validates :document, presence: true
  validates :type_of, presence: true
  validates :term_number, presence: true
end
