class CreateKinship < ActiveRecord::Migration
  def change
    create_table :kinships do |t|
      t.belongs_to :student, index: true
      t.belongs_to :guardian, index: true
      t.string :kinship
      t.timestamps null: false
    end

    remove_column :guardians, :kinship
    drop_table :guardians_students
  end
end
