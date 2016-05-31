class Group < ActiveRecord::Base
  has_many :students
  has_and_belongs_to_many :teachers
  validates :number, presence: true
  validates :grade, presence: true
end
