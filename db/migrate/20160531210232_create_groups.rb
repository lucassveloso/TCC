class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :number
      t.string :classroom
      t.string :grade
      t.string :notes
      t.timestamps null: false
    end
  end
end
