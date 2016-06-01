class CreateAuthorizationsStudents < ActiveRecord::Migration
  def change
    create_table :authorizations_students do |t|
      t.belongs_to :authorization, index: true
      t.belongs_to :student, index: true
    end
  end
end
