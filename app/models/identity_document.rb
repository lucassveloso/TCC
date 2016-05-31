class IdentityDocument < ActiveRecord::Base
  has_one :person
  validates :identity_number, presence: true
end
