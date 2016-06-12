class Address < ActiveRecord::Base
  has_one :person
end
