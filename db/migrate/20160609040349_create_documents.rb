class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :cpf
      t.integer :identity_document_id
      t.timestamps null: false
    end

    remove_column :people, :cpf
    remove_column :people, :identity_document_id
    add_column :people, :document_id, :integer
    remove_column :certificates, :person_id
    add_column :certificates, :document_id, :integer
  end
end
