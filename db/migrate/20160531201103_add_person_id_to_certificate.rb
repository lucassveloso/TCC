class AddPersonIdToCertificate < ActiveRecord::Migration
  def change
     add_column :certificates, :person_id, :integer
  end
end
