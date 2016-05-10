class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.integer :person_id
      t.string :kinship
      t.integer :student_id
      t.timestamps null: false
    end
  end
end
