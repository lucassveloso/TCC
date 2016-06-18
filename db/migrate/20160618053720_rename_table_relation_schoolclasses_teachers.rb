class RenameTableRelationSchoolclassesTeachers < ActiveRecord::Migration
  def change
    rename_table :teachers_school_classes, :school_classes_teachers
  end
end
