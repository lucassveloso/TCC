class ChangeRelationBetweenDocumentsCertificates < ActiveRecord::Migration
  def change
    remove_column :certificates, :document_id
    add_column :documents, :certificate_id, :integer
  end
end
