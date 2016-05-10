class Responsible < ActiveRecord::Base
  belongs_to :person, dependent: :destroy
  belongs_to :student
end
