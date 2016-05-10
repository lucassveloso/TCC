class Address < ActiveRecord::Base
  has_one :person
  validates :address, presence: true
  validates :city, presence: true
end
