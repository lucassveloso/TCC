class Teacher < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  has_and_belongs_to_many :groups
  validates :person, presence: true
  validates :registration_number, presence: true
end
