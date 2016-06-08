class RenameGroupsToSchoolClasses < ActiveRecord::Migration
  def change
    rename_table :groups, :school_classes
    rename_column :groups_teachers, :group_id, :school_class_id
    rename_table :groups_teachers, :teachers_school_classes
    rename_column :students, :group_id, :school_class_id
  end
end
