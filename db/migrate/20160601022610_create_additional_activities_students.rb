class CreateAdditionalActivitiesStudents < ActiveRecord::Migration
  def change
    create_table :additional_activities_students do |t|
      t.belongs_to :additional_activity, index: true
      t.belongs_to :student, index: true
    end
  end
end
