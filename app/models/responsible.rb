class Responsible < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :student
  validates :person, presence: true
  validates :kinship, presence: true
  validates :student, presence: true
end
