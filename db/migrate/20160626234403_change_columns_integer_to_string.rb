class ChangeColumnsIntegerToString < ActiveRecord::Migration
  def change
    change_column :identity_documents, :identity_number, :string
    change_column :school_classes, :number, :string
    change_column :students, :nis_number, :string
    change_column :teachers, :registration_number, :string
  end
end
