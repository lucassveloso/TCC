class PassStudentsDocumentsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :identity_document_id, :integer
    add_column :people, :cpf, :string
    add_column :people, :email, :string
    remove_column :students, :certificate_id, :integer
    remove_column :students, :identity_document_id, :integer
    remove_column :students, :cpf, :string
  end
end
