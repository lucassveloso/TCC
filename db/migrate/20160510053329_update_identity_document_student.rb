class UpdateIdentityDocumentStudent < ActiveRecord::Migration
  def change
    rename_column :students, :identify_document_id, :identity_document_id
  end
end
