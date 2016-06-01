class AdditionalActivity < ActiveRecord::Base
  has_and_belongs_to_many :students
  validates :activity, presence: true
end
