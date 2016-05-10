class UpdateTypeCertificate < ActiveRecord::Migration
  def change
    rename_column :certificates, :type, :type_of
  end
end
