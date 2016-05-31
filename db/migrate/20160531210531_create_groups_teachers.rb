class CreateGroupsTeachers < ActiveRecord::Migration
  def change
    create_table :groups_teachers do |t|
      t.belongs_to :group, index: true
      t.belongs_to :teacher, index: true
    end
  end
end
