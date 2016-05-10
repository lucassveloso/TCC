class IdentityDocument < ActiveRecord::Base
  has_one :student
  validates :identity_number, presence: true
end
