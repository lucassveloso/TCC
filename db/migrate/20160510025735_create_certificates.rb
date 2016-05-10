class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :type
      t.integer :term_number
      t.integer :sheet_number
      t.string :book
      t.date :emission_date
      t.string :federation_unit
      t.string :notarys_office
      t.timestamps null: false
    end
  end
end
