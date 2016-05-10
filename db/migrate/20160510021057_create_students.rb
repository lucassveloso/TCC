class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :person_id
      t.integer :nis_number
      t.integer :certificate_id
      t.integer :identify_document_id
      t.string :cpf
      t.date :entry_date
      t.string :special_needs
      t.string :teaching_step
      t.string :photo_url
      t.timestamps null: false
    end
  end
end
