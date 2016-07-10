class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true
  before_save { self.email = email.downcase }
end
