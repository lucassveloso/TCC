class IdentityDocument < ActiveRecord::Base
  has_one :document
  validates :identity_number, presence: true
end
