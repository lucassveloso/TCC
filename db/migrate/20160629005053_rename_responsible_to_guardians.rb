class RenameResponsibleToGuardians < ActiveRecord::Migration
  def change
    rename_table :responsibles, :guardians
    rename_column :responsibles_students, :responsible_id, :guardian_id
    rename_table :responsibles_students, :guardians_students
  end
end
