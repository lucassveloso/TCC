class Guardian < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  has_and_belongs_to_many :students
  validates :person, presence: true
  validates :kinship, presence: true
  validates :students, presence: true
end
