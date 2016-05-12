class CreateResponsiblesAndStudents < ActiveRecord::Migration
  def change
    create_table :responsibles_students do |t|
      t.belongs_to :responsible, index: true
      t.belongs_to :student, index: true
    end

    remove_column :responsibles, :student_id
  end
end
