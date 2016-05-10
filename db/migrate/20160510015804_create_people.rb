class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :genre
      t.date :birthdate
      t.string :race
      t.string :phone
      t.string :cellphone
      t.string :naturalness
      t.string :nationality
      t.integer :address_id
      t.timestamps null: false
    end
  end
end
