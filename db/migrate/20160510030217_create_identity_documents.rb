class CreateIdentityDocuments < ActiveRecord::Migration
  def change
    create_table :identity_documents do |t|
      t.integer :identity_number
      t.date :dispatch_date
      t.string :federation_unit
      t.string :dispatcher_organ
      t.timestamps null: false
    end
  end
end
