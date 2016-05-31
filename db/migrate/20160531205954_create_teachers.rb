class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :person_id
      t.integer :registration_number
      t.string :notes
      t.string :time_load
      t.string :subject
      t.date :admission_date
      t.string :qualifications
      t.timestamps null: false
    end
  end
end
