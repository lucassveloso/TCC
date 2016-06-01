class AddBolsaFamiliaToStudent < ActiveRecord::Migration
  def change
    add_column :students, :bolsa_familia, :boolean
  end
end
