class Teacher < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  has_and_belongs_to_many :school_classes
  validates :person, presence: true
  validates :registration_number, presence: true
end
