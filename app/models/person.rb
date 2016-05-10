class Person < ActiveRecord::Base
  belongs_to :address, dependent: :destroy
  has_one :responsible
  has_one :student
end
